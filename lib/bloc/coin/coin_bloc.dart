import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointicker/api/clients/client.dart';
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

  // void _updateCoinList(_UpdateCoinList event, Emitter<CoinState> emit) {
  //   emit(state.copyWith(coinList: event.coins));
  // }

  void _fetchCoinSuccess(_FetchCoinSuccess event, Emitter<CoinState> emit) {
    emit(state.copyWith(
      getCoinStatus: FormzSubmissionStatus.success,
      coinList: event.coins,
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
}
