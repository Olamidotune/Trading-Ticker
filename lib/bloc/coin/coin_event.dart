part of 'coin_bloc.dart';

@freezed
class CoinEvent with _$CoinEvent {
  const factory CoinEvent() = _CoinEvent;
  const factory CoinEvent.fetchCoins() = _FetchCoins;
  const factory CoinEvent.updateCoinList(Coin coins) = _UpdateCoinList;
  const factory CoinEvent.fetchCoinSuccess(List<Coin> coins) =
      _FetchCoinSuccess;
  const factory CoinEvent.fetchCoinFailure([String? errorMessage]) =
      _FetchCoinFailure;
  const factory CoinEvent.searchCrypto(String cryptoSearchString) =
      _SearchCrypto;
  const factory CoinEvent.cryptoSearchStringChanged(
    String cryptoSearchString,
  ) = _CryptoSearchStringChanged;
  const factory CoinEvent.sortByMarketCapDesc() = _SortByMarketCapDesc;
  const factory CoinEvent.sortByPriceDesc() = _SortByPriceDesc;
  const factory CoinEvent.sortBy24hChangeDesc() = _SortBy24hChangeDesc;
}
