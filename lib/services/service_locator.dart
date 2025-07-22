import 'package:cointicker/api/clients/client.dart';
import 'package:cointicker/services/keys.dart';
import 'package:cointicker/services/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final dio = Dio(BaseOptions(headers: baseHeaders));

  if (kDebugMode) {
    dio.interceptors.add(ResponseLoggingInterceptor());
    locator.registerFactory<CoinClient>(
      () => CoinClient(
        dio,
        baseUrl: dotenv.env[EnvKeys.apiBaseUrl] ??
            const String.fromEnvironment(EnvKeys.apiBaseUrl),
      ),
    );
  } else {
    locator.registerSingleton<CoinClient>(
        CoinClient(dio, baseUrl: dotenv.env[EnvKeys.apiBaseUrl]));
  }

  // locator
  //   ..registerSingleton<AuthServices>(AuthServices())
  //   ..registerSingleton<PersistenceServices>(PersistenceServices());
}
