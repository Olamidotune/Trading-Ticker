import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/api/clients/coin/coin_client.dart';
import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/enums/coin_sort_type.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';
part 'crypto_bloc.freezed.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final AuthBloc _authBloc;
  final FirebaseAuth _auth;
  Timer? _pollingTimer;

  StreamSubscription? _watchlistSubscription;
  StreamSubscription? authSubscription;

  CryptoBloc(this._authBloc, this._auth) : super(CryptoState()) {
    on<_FetchCoins>(_fetchCoins);
    on<_FetchCoinSuccess>(_fetchCoinSuccess);
    on<_FetchCoinFailure>(_fetchCoinFailure);

    on<_SearchCrypto>(_searchCrypto);

    on<_CryptoSearchStringChanged>(_cryptoSearchStringChanged);
    on<_SortBy24hChangeDesc>(_sortBy24hChangeDesc);
    on<_SortByMarketCapDesc>(_sortByMarketCapDesc);
    on<_SortByPriceDesc>(_sortByPriceDesc);

    on<_AddToWatchList>(_addToWatchList);
    on<_AddToWatchListSuccessful>(_addToWatchListSuccessful);
    on<_AddToWatchListFailed>(_addToWatchListFailed);

    on<_FetchWatchList>(_fetchWatchList);
    on<_FetchWatchListSuccessful>(_fetchWatchListSuccessful);
    on<_FetchWatchListFailed>(_fetchWatchListFailed);

    on<_ClearWatchlist>(_clearWatchlist);
    on<_WatchlistUpdated>(_watchlistUpdated);
    on<_RemoveFromWatchList>(_removeFromWatchList);
    on<_RemoveFromWatchListSuccessful>(_removeFromWatchListSuccessful);
    on<_RemoveFromWatchListFailed>(_removeFromWatchListFailed);

    on<_ErrorMessage>(_errorMessage);

    on<_CancelFirestoreSubscription>(_cancelFirebaseSubscription);
    on<_Init>(_init);

    add(const CryptoEvent.init());
    _startPolling();

    authSubscription = _authBloc.stream.listen((authState) {
      if (authState.isAuthenticated) {
        add(const CryptoEvent.fetchWatchList());
      } else if (!authState.isAuthenticated) {
        add(const CryptoEvent.clearWatchlist());
      }
    });
  }

  void _clearWatchlist(_ClearWatchlist event, Emitter<CryptoState> emit) {
    _watchlistSubscription?.cancel();
    emit(state.copyWith(
      watchlistCoinIds: {},
      fetchWatchListStatus: FormzSubmissionStatus.initial,
    ));
  }

  void _init(_Init event, Emitter<CryptoState> emit) {
    emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.initial));

    add(const CryptoEvent.fetchCoins());
    add(const _FetchWatchList());
  }

  void _startPolling() {
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) {
        if (_auth.currentUser != null) {
          add(const CryptoEvent.fetchCoins());
        }
      },
    );
  }

  void _fetchCoins(_FetchCoins event, Emitter<CryptoState> emit) async {
    if (state.getCoinStatus.isInProgress) return;

    emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.inProgress));

    final isFirstFetch = state.coinList == null || state.coinList!.isEmpty;

    if (isFirstFetch) {
      emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.inProgress));
    }

    try {
      final List<Coin> coins = await locator<CoinClient>().getCoins();
      add(CryptoEvent.fetchCoinSuccess(coins));
      add(_FetchCoinSuccess(coins));
    } catch (error, trace) {
      logError(error, trace);
      if (error is DioException && error.response?.data['message'] != null) {
        add(CryptoEvent.fetchCoinFailure(
            error.response?.data['message'] as String));
      } else {
        add(const CryptoEvent.fetchCoinFailure('Something went wrong'));
      }
    }
  }

  void _fetchCoinSuccess(_FetchCoinSuccess event, Emitter<CryptoState> emit) {
    List<Coin> updatedCoins = List<Coin>.from(event.coins);

    switch (state.activeSort) {
      case CoinSortType.priceDesc:
        updatedCoins.sort(
            (a, b) => (b.currentPrice ?? 0).compareTo(a.currentPrice ?? 0));
        break;
      case CoinSortType.marketCapDesc:
        updatedCoins
            .sort((a, b) => (b.marketCap ?? 0).compareTo(a.marketCap ?? 0));
        break;
      case CoinSortType.change24hDesc:
        updatedCoins.sort((a, b) => (b.priceChangePercentage24h ?? 0)
            .compareTo(a.priceChangePercentage24h ?? 0));
        break;
      default:
        break;
    }

    emit(state.copyWith(
      getCoinStatus: FormzSubmissionStatus.success,
      coinList: updatedCoins,
    ));
  }

  void _fetchCoinFailure(_FetchCoinFailure event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
      getCoinStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }

  void _searchCrypto(_SearchCrypto event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
      cryptoSearchString: event.cryptoSearchString,
      coinList: state.coinList,
    ));
  }

  Future<void> _addToWatchList(
      _AddToWatchList event, Emitter<CryptoState> emit) async {
    if (state.addToWatchListStatus.isInProgress) return;

    emit(
        state.copyWith(addToWatchListStatus: FormzSubmissionStatus.inProgress));

    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        emit(
          state.copyWith(
            errorMessage: 'User not authenticated',
            addToWatchListStatus: FormzSubmissionStatus.failure,
          ),
        );
        return;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('watchlist')
          .doc(event.coin.id)
          .set({
        'coinId': event.coin.id,
        'name': event.coin.name,
        'symbol': event.coin.symbol,
        'addedAt': FieldValue.serverTimestamp(),
      });

      logInfo('Added ${event.coin.name} to watchlist for $uid');
      add(const _AddToWatchListSuccessful());
    } catch (error, trace) {
      logError(error, trace);
      add(const _AddToWatchListFailed('Something went wrong.'));
    }
  }

  void _addToWatchListSuccessful(
      _AddToWatchListSuccessful event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
        addToWatchListStatus: FormzSubmissionStatus.success,
        errorMessage: null));
  }

  void _addToWatchListFailed(
      _AddToWatchListFailed event, Emitter<CryptoState> emit) {
    emit(state.copyWith(addToWatchListStatus: FormzSubmissionStatus.failure));

    add(_ErrorMessage(event.message ?? 'Something went wrong.'));
  }

  void _cryptoSearchStringChanged(
      _CryptoSearchStringChanged event, Emitter<CryptoState> emit) {
    emit(state.copyWith(cryptoSearchString: event.cryptoSearchString));
  }

  void _sortByMarketCapDesc(
      _SortByMarketCapDesc event, Emitter<CryptoState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList.sort((a, b) => (b.marketCap ?? 0).compareTo(a.marketCap ?? 0));

    if (event.sortByMarketCapDesc == true ||
        state.isAllFilterSelected == false) {
      emit(state.copyWith(
        coinList: sortedList,
        activeSort: CoinSortType.marketCapDesc,
        sortByPriceDesc: true,
        sortBy24ChangeDesc: true,
      ));
    } else {
      emit(state.copyWith(
        sortByPriceDesc: false,
        sortBy24ChangeDesc: false,
      ));
    }
  }

  void _sortByPriceDesc(_SortByPriceDesc event, Emitter<CryptoState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList
        .sort((a, b) => (b.currentPrice ?? 0).compareTo(a.currentPrice ?? 0));

    if (event.sortByPriceDesc == true) {
      emit(state.copyWith(
        coinList: sortedList,
        activeSort: CoinSortType.priceDesc,
        sortByPriceDesc: true,
        sortBy24ChangeDesc: false,
      ));
    } else {
      emit(state.copyWith(sortByPriceDesc: false));
    }
  }

  void _sortBy24hChangeDesc(
      _SortBy24hChangeDesc event, Emitter<CryptoState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList.sort((a, b) => (b.priceChangePercentage24h ?? 0)
        .compareTo(a.priceChangePercentage24h ?? 0));

    if (event.sortBy24hChangeDesc == true) {
      emit(state.copyWith(
        coinList: sortedList,
        activeSort: CoinSortType.change24hDesc,
        sortBy24ChangeDesc: true,
        sortByPriceDesc: false,
      ));
    } else {
      emit(state.copyWith(sortBy24ChangeDesc: false));
    }
  }

  void _errorMessage(_ErrorMessage event, Emitter<CryptoState> emit) {
    emit(state.copyWith(errorMessage: event.message));
  }

  void _fetchWatchList(_FetchWatchList event, Emitter<CryptoState> emit) {
    emit(
        state.copyWith(fetchWatchListStatus: FormzSubmissionStatus.inProgress));

    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;
    try {
      _watchlistSubscription?.cancel();

      _watchlistSubscription = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('watchlist')
          .snapshots()
          .listen((snapshot) {
        final coinIds = snapshot.docs.map((doc) => doc.id).toSet();
        add(_WatchlistUpdated(coinIds));
      });
    } catch (error, trace) {
      logError(error, trace);
      add(const _FetchWatchListFailed('Something went wrong.'));
    }
  }

  void _fetchWatchListSuccessful(
      _FetchWatchListSuccessful event, Emitter<CryptoState> emit) {
    emit(state.copyWith(fetchWatchListStatus: FormzSubmissionStatus.success));
  }

  void _fetchWatchListFailed(
      _FetchWatchListFailed event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
        errorMessage: event.message,
        fetchWatchListStatus: FormzSubmissionStatus.failure));
  }

  void _watchlistUpdated(_WatchlistUpdated event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
      watchlistCoinIds: event.coinIds,
      fetchWatchListStatus: FormzSubmissionStatus.success,
    ));
  }

  Future<void> _removeFromWatchList(
      _RemoveFromWatchList event, Emitter<CryptoState> emit) async {
    if (state.removeFromWatchListStatus.isInProgress) return;

    emit(state.copyWith(
      removeFromWatchListStatus: FormzSubmissionStatus.inProgress,
    ));

    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        emit(state.copyWith(
            removeFromWatchListStatus: FormzSubmissionStatus.failure,
            errorMessage: 'User not authenticated'));
        return;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('watchlist')
          .doc(event.coin.id)
          .delete();

      logInfo('Removed ${event.coin.name} from watchlist for $uid');
      add(const _RemoveFromWatchListSuccessful());
    } catch (error, trace) {
      logError(error, trace);
      add(const _RemoveFromWatchListSuccessful());
    }
  }

  void _removeFromWatchListSuccessful(
      _RemoveFromWatchListSuccessful event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
        removeFromWatchListStatus: FormzSubmissionStatus.success,
        errorMessage: null));
  }

  void _removeFromWatchListFailed(
      _RemoveFromWatchListFailed event, Emitter<CryptoState> emit) {
    emit(state.copyWith(
        removeFromWatchListStatus: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to remove from watchlist.'));
    add(_ErrorMessage(event.message ?? 'Failed to remove from watchlist.'));
  }

  void _cancelFirebaseSubscription(
      _CancelFirestoreSubscription event, Emitter<CryptoState> emit) {
    _watchlistSubscription?.cancel();
    logInfo('Firestore watchlist subscription cancelled.');
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    _watchlistSubscription?.cancel();
    authSubscription?.cancel();
    return super.close();
  }
}
