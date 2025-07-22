part of 'coin_bloc.dart';

@freezed
class CoinEvent with _$CoinEvent {
  const factory CoinEvent() = _CoinEvent;

  // Define other events here as needed
  // For example, you might have an event to fetch coins:
  const factory CoinEvent.fetchCoins() = _FetchCoins;
  const factory CoinEvent.updateCoinList(Coin coins) = _UpdateCoinList;
  const factory CoinEvent.fetchCoinSuccess(List<Coin> coins) =
      _FetchCoinSuccess;

  const factory CoinEvent.fetchCoinFailure([String? errorMessage]) =
      _FetchCoinFailure;
}
