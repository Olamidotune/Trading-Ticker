// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/api/clients/coin/coin_client.dart';
import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/enums/coin_sory_type.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_event.dart';
part 'coin_state.dart';
part 'coin_bloc.freezed.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  StreamSubscription<QuerySnapshot>? _watchlistSubscription;
  Timer? _timer;

  CoinBloc() : super(CoinState()) {
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
    on<_WatchlistUpdated>(_watchlistUpdated);

    on<_RemoveFromWatchList>(_removeFromWatchList);
    on<_RemoveFromWatchListSuccessful>(_removeFromWatchListSuccessful);
    on<_RemoveFromWatchListFailed>(_removeFromWatchListFailed);

    on<_ErrorMessage>(_errorMessage);
    on<_Init>(_init);

    add(const CoinEvent.init());
    _startPolling();
  }

  void _init(_Init event, Emitter<CoinState> emit) {
    emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.initial));

    add(const CoinEvent.fetchCoins());
    add(const _FetchWatchList());
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      add(const CoinEvent.fetchCoins());
    });
  }

  void _fetchCoins(_FetchCoins event, Emitter<CoinState> emit) async {
    if (state.getCoinStatus.isInProgress) return;

    emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.inProgress));

    final isFirstFetch = state.coinList == null || state.coinList!.isEmpty;

    if (isFirstFetch) {
      emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.inProgress));
    }

    try {
      final List<Coin> coins = await locator<CoinClient>().getCoins();
      // add(CoinEvent.fetchCoinSuccess(coins));
      add(_FetchCoinSuccess(coins));
    } catch (error, trace) {
      logError(error, trace);
      if (error is DioException && error.response?.data['message'] != null) {
        add(CoinEvent.fetchCoinFailure(
            error.response?.data['message'] as String));
      } else {
        add(const CoinEvent.fetchCoinFailure('Something went wrong'));
      }
    }
  }

  void _fetchCoinSuccess(_FetchCoinSuccess event, Emitter<CoinState> emit) {
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

  void _fetchCoinFailure(_FetchCoinFailure event, Emitter<CoinState> emit) {
    emit(state.copyWith(
      getCoinStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }

  void _searchCrypto(_SearchCrypto event, Emitter<CoinState> emit) {
    emit(state.copyWith(
      cryptoSearchString: event.cryptoSearchString,
      coinList: state.coinList,
    ));
  }

  Future<void> _addToWatchList(
      _AddToWatchList event, Emitter<CoinState> emit) async {
    if (state.addToWatchListStatus.isInProgress) return;

    emit(state.copyWith(
        addToWatchListStatus: FormzSubmissionStatus.inProgress)); // 👈 Add this

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
      _AddToWatchListSuccessful event, Emitter<CoinState> emit) {
    emit(state.copyWith(
        addToWatchListStatus: FormzSubmissionStatus.success,
        errorMessage: null));
  }

  void _addToWatchListFailed(
      _AddToWatchListFailed event, Emitter<CoinState> emit) {
    emit(state.copyWith(addToWatchListStatus: FormzSubmissionStatus.failure));

    add(_ErrorMessage(event.message ?? 'Something went wrong.'));
  }

  void _cryptoSearchStringChanged(
      _CryptoSearchStringChanged event, Emitter<CoinState> emit) {
    emit(state.copyWith(cryptoSearchString: event.cryptoSearchString));
  }

  void _sortByMarketCapDesc(
      _SortByMarketCapDesc event, Emitter<CoinState> emit) {
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

  void _sortByPriceDesc(_SortByPriceDesc event, Emitter<CoinState> emit) {
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
      _SortBy24hChangeDesc event, Emitter<CoinState> emit) {
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

  void _errorMessage(_ErrorMessage event, Emitter<CoinState> emit) {
    emit(state.copyWith(errorMessage: event.message));
  }

  void _fetchWatchList(_FetchWatchList event, Emitter<CoinState> emit) {
    emit(
        state.copyWith(fetchWatchListStatus: FormzSubmissionStatus.inProgress));

    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;
    try {
      // Cancel previous subscription if exists
      _watchlistSubscription?.cancel();

      // Listen to watchlist changes
      _watchlistSubscription = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('watchlist')
          .snapshots()
          .listen((snapshot) {
        // Extract coin IDs from the snapshot
        final coinIds = snapshot.docs.map((doc) => doc.id).toSet();
        add(_WatchlistUpdated(coinIds));
      });
    } catch (error, trace) {
      logError(error, trace);
    }
  }

  void _fetchWatchListSuccessful(
      _FetchWatchListSuccessful event, Emitter<CoinState> emit) {
    emit(state.copyWith(fetchWatchListStatus: FormzSubmissionStatus.success));
  }

  void _fetchWatchListFailed(
      _FetchWatchListFailed event, Emitter<CoinState> emit) {
    emit(state.copyWith(
        errorMessage: event.message,
        fetchWatchListStatus: FormzSubmissionStatus.failure));
  }

  void _watchlistUpdated(_WatchlistUpdated event, Emitter<CoinState> emit) {
    emit(state.copyWith(
      watchlistCoinIds: event.coinIds,
      fetchWatchListStatus:
          FormzSubmissionStatus.success, // 👈 Also update status
    ));
  }

  Future<void> _removeFromWatchList(
      _RemoveFromWatchList event, Emitter<CoinState> emit) async {
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
      _RemoveFromWatchListSuccessful event, Emitter<CoinState> emit) {
    emit(state.copyWith(
        removeFromWatchListStatus: FormzSubmissionStatus.success,
        errorMessage: null));
  }

  void _removeFromWatchListFailed(
      _RemoveFromWatchListFailed event, Emitter<CoinState> emit) {
    emit(state.copyWith(
        removeFromWatchListStatus: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to remove from watchlist.'));
    add(_ErrorMessage(event.message ?? 'Failed to remove from watchlist.'));
  }

  @override
  Future<void> close() {
    _watchlistSubscription?.cancel();
    return super.close();
  }
}
