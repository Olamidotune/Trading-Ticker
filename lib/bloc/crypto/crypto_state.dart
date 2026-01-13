part of 'crypto_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const CryptoState._();
  factory CryptoState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getCoinStatus,
    List<Coin>? coinList,
    String? errorMessage,
    String? cryptoSearchString,
    CoinSortType? activeSort,
    @Default(true) sortByPriceDesc,
    @Default(true) sortBy24ChangeDesc,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus addToWatchListStatus,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchWatchListStatus,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus removeFromWatchListStatus,
    @Default({}) Set<String> watchlistCoinIds,
  }) = _CoinState;

  bool get isAllFilterSelected => sortByPriceDesc && sortBy24ChangeDesc;

  bool isInWatchlist(String coinId) => watchlistCoinIds.contains(coinId);

  List<Coin> get getSearchedCoins {
    if ((cryptoSearchString?.length ?? 0) == 0) return [];

    final RegExp exp = RegExp(
      '^${cryptoSearchString ?? ''}',
      caseSensitive: false,
    );

    return coinList!.where((e) => exp.firstMatch(e.name) != null).toList();
  }

  List<Coin> get computedCrypto =>
      (cryptoSearchString?.isEmpty ?? true) ? coinList ?? [] : getSearchedCoins;
}
