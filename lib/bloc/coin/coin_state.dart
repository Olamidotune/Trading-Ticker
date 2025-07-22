part of 'coin_bloc.dart';

@freezed
class CoinState with _$CoinState {
  factory CoinState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getCoinStatus,
    List<Coin>? coinList,
    String? errorMessage,
  }) = _CoinState;
}
