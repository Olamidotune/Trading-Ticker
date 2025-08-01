part of 'coin_bloc.dart';

@freezed
class CoinEvent with _$CoinEvent {
  const factory CoinEvent() = _CoinEvent;
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
  const factory CoinEvent.init() = _Init;
}
