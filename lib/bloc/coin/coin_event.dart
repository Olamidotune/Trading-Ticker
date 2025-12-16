part of 'coin_bloc.dart';

@freezed
class CoinEvent with _$CoinEvent {
  const factory CoinEvent() = _CoinEvent;

  const factory CoinEvent.init() = _Init;
  const factory CoinEvent.fetchCoins() = _FetchCoins;
  const factory CoinEvent.fetchCoinSuccess(List<Coin> coins) =
      _FetchCoinSuccess;
  const factory CoinEvent.fetchCoinFailure([String? errorMessage]) =
      _FetchCoinFailure;
  const factory CoinEvent.searchCrypto(String cryptoSearchString) =
      _SearchCrypto;
  const factory CoinEvent.cryptoSearchStringChanged(
    String cryptoSearchString,
  ) = _CryptoSearchStringChanged;
  const factory CoinEvent.sortByMarketCapDesc(bool sortByMarketCapDesc) =
      _SortByMarketCapDesc;
  const factory CoinEvent.sortByPriceDesc(bool? sortByPriceDesc) =
      _SortByPriceDesc;
  const factory CoinEvent.sortBy24hChangeDesc(bool? sortBy24hChangeDesc) =
      _SortBy24hChangeDesc;

  const factory CoinEvent.addToWatchList(Coin coin) = _AddToWatchList;
  const factory CoinEvent.addToWatchListSuccessful() =
      _AddToWatchListSuccessful;
  const factory CoinEvent.addToWatchListFailed(String? message) =
      _AddToWatchListFailed;

  const factory CoinEvent.fetchWatchList() = _FetchWatchList;
  const factory CoinEvent.fetchWatchListSuccessful() =
      _FetchWatchListSuccessful;
  const factory CoinEvent.fetchWatchListFailed(String? message) =
      _FetchWatchListFailed;

  const factory CoinEvent.removeFromWatchList(Coin coin) = _RemoveFromWatchList;
  const factory CoinEvent.removeFromWatchListSuccessful() =
      _RemoveFromWatchListSuccessful;
  const factory CoinEvent.removeFromWatchListFailed(String? message) =
      _RemoveFromWatchListFailed;

  const factory CoinEvent.watchlistUpdated(Set<String> coinIds) =
      _WatchlistUpdated;

  const factory CoinEvent.errorMessage(String message) = _ErrorMessage;
}
