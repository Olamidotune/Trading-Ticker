import 'package:cointicker/api/models/coins_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'coin_client.g.dart';

@RestApi()
abstract class CoinClient {
  factory CoinClient(Dio dio, {String? baseUrl}) = _CoinClient;

  @GET(
      'api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true')
  Future<List<Coin>> getCoins();
}
