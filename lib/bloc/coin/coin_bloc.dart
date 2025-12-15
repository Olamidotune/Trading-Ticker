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
    on<_AddFavCoin>(_addFavCoin);
    on<_AddFavCoinSuccessful>(_addFavCoinSuccessful);
    on<_AddFavCoinFailed>(_addFavCoinFailed);
    on<_Init>(_init);

    add(const CoinEvent.init());
    _startPolling();
  }

  void _init(_Init event, Emitter<CoinState> emit) {
    emit(state.copyWith(getCoinStatus: FormzSubmissionStatus.initial));
    add(const CoinEvent.fetchCoins());
    logInfo('CoinBloc initialized');
    logInfo('this is the uid: ${FirebaseAuth.instance.currentUser!.uid}');
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

  void _addFavCoin(_AddFavCoin event, Emitter<CoinState> emit) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('watchList')
        .doc(event.coin.id) // CoinGecko ID
        .set({
      'coinId': event.coin.id,
      'name': event.coin.name,
      'symbol': event.coin.symbol,
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  void _addFavCoinSuccessful(
      _AddFavCoinSuccessful event, Emitter<CoinState> emit) {
    emit(state.copyWith());
  }

  void _addFavCoinFailed(_AddFavCoinFailed event, Emitter<CoinState> emit) {
    emit(state.copyWith());
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
}
