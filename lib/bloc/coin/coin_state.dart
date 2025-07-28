part of 'coin_bloc.dart';

@freezed
class CoinState with _$CoinState {
  const CoinState._();
  factory CoinState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getCoinStatus,
    List<Coin>? coinList,
    String? errorMessage,
    String? cryptoSearchString,
    CoinSortType? activeSort,
  }) = _CoinState;

  List<Coin> get getSearchedCoins {
    if ((cryptoSearchString?.length ?? 0) == 0) return [];

    final RegExp exp = RegExp(
      '^${cryptoSearchString ?? ''}',
      caseSensitive: false,
    );

    return coinList!.where((e) => exp.firstMatch(e.name) != null).toList();
  }

  List<Coin> get computedGiftCards =>
      (cryptoSearchString?.isEmpty ?? true) ? coinList ?? [] : getSearchedCoins;
}
