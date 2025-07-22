import 'package:cointicker/api/models/coins_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi()

// String newsAPIurl =
// 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

abstract class CoinClient {
  factory CoinClient(Dio dio, {String? baseUrl}) = _CoinClient;

  @GET(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=2&page=1&sparkline=false')
  Future<List<Coin>> getCoins();
}
