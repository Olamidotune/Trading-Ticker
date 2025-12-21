part of 'coin_bloc.dart';

@freezed
class CryptoEvent with _$CryptoEvent {
  const factory CryptoEvent() = _CoinEvent;

  const factory CryptoEvent.init() = _Init;
  const factory CryptoEvent.fetchCoins() = _FetchCoins;
  const factory CryptoEvent.fetchCoinSuccess(List<Coin> coins) =
      _FetchCoinSuccess;
  const factory CryptoEvent.fetchCoinFailure([String? errorMessage]) =
      _FetchCoinFailure;
  const factory CryptoEvent.searchCrypto(String cryptoSearchString) =
      _SearchCrypto;
  const factory CryptoEvent.cryptoSearchStringChanged(
    String cryptoSearchString,
  ) = _CryptoSearchStringChanged;
  const factory CryptoEvent.sortByMarketCapDesc(bool sortByMarketCapDesc) =
      _SortByMarketCapDesc;
  const factory CryptoEvent.sortByPriceDesc(bool? sortByPriceDesc) =
      _SortByPriceDesc;
  const factory CryptoEvent.sortBy24hChangeDesc(bool? sortBy24hChangeDesc) =
      _SortBy24hChangeDesc;

  const factory CryptoEvent.addToWatchList(Coin coin) = _AddToWatchList;
  const factory CryptoEvent.addToWatchListSuccessful() =
      _AddToWatchListSuccessful;
  const factory CryptoEvent.addToWatchListFailed(String? message) =
      _AddToWatchListFailed;

  const factory CryptoEvent.fetchWatchList() = _FetchWatchList;
  const factory CryptoEvent.fetchWatchListSuccessful() =
      _FetchWatchListSuccessful;
  const factory CryptoEvent.fetchWatchListFailed(String? message) =
      _FetchWatchListFailed;

  const factory CryptoEvent.removeFromWatchList(Coin coin) =
      _RemoveFromWatchList;
  const factory CryptoEvent.removeFromWatchListSuccessful() =
      _RemoveFromWatchListSuccessful;
  const factory CryptoEvent.removeFromWatchListFailed(String? message) =
      _RemoveFromWatchListFailed;

  const factory CryptoEvent.watchlistUpdated(Set<String> coinIds) =
      _WatchlistUpdated;

  const factory CryptoEvent.errorMessage(String message) = _ErrorMessage;
}
