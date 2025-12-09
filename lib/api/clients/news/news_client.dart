import 'package:cointicker/api/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'news_client.g.dart';

@RestApi()
abstract class NewsClient {
  factory NewsClient(Dio dio, {String? baseUrl}) = _NewsClient;

  @GET('/everything')
  Future<News> getNews({
    @Query('q') required String searchKey,
    @Query('from') required String fromDate,
    @Query('sortBy') String sortBy = 'publishedAt',
    @Query('pageSize') int pageSize = 20,
    @Query('page') int page = 1,
    @Query('apiKey') String? apiKey,
  });
}
