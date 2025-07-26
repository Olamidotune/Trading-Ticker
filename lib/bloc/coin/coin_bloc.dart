// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointicker/api/clients/coin/coin_client.dart';
import 'package:cointicker/api/models/coins_model.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:dio/dio.dart';
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

    _startPolling();
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      add(const CoinEvent.fetchCoins());
    });
    logInfo('CoinBloc started polling every 30 seconds');
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
      add(CoinEvent.fetchCoinSuccess(coins));
    } catch (error) {
      if (error is DioException && error.response?.data['message'] != null) {
        add(CoinEvent.fetchCoinFailure(
            error.response?.data['message'] as String));
      } else {
        add(const CoinEvent.fetchCoinFailure('Something went wrong'));
      }
    }
  }

  void _fetchCoinSuccess(_FetchCoinSuccess event, Emitter<CoinState> emit) {
    List<Coin> updatedCoins = List<Coin>.from(event.coins); // ✅ clone it

    switch (state.activeSort) {
      case CoinSortType.priceDesc:
        updatedCoins.sort((a, b) => b.currentPrice.compareTo(a.currentPrice));
        break;
      case CoinSortType.marketCapDesc:
        updatedCoins.sort((a, b) => b.marketCap.compareTo(a.marketCap));
        break;
      case CoinSortType.change24hDesc:
        updatedCoins.sort((a, b) =>
            b.priceChangePercentage24h.compareTo(a.priceChangePercentage24h));
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

  void _cryptoSearchStringChanged(
      _CryptoSearchStringChanged event, Emitter<CoinState> emit) {
    emit(state.copyWith(cryptoSearchString: event.cryptoSearchString));
  }

  void _sortByMarketCapDesc(
      _SortByMarketCapDesc event, Emitter<CoinState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList.sort((a, b) => (b.marketCap).compareTo(a.marketCap));
    emit(state.copyWith(
        coinList: sortedList, activeSort: CoinSortType.marketCapDesc));
  }

  void _sortByPriceDesc(_SortByPriceDesc event, Emitter<CoinState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList.sort((a, b) => (b.currentPrice).compareTo(a.currentPrice));
    emit(state.copyWith(
        coinList: sortedList, activeSort: CoinSortType.priceDesc));
  }

  void _sortBy24hChangeDesc(
      _SortBy24hChangeDesc event, Emitter<CoinState> emit) {
    final sortedList = List<Coin>.from(state.coinList ?? []);
    sortedList.sort((a, b) =>
        (b.priceChangePercentage24h).compareTo(a.priceChangePercentage24h));
    emit(state.copyWith(
        coinList: sortedList, activeSort: CoinSortType.change24hDesc));
  }
}
