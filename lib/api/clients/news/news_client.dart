import 'package:cointicker/api/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'news_client.g.dart';

@RestApi()
abstract class NewsClient {
  factory NewsClient(Dio dio, {String? baseUrl}) = _NewsClient;

  // @GET(
  //     'https://newsapi.org/v2/everything?q={searchKey}&from=2025-07-20&sortBy=publishedAt&pageSize=20&apiKey=9c337956eae7413bbc102eb80bc23327')
  // Future<News> getNews(

  // );

  @GET('/everything')
  Future<News> getNews({
    @Query('q') required String searchKey,
    @Query('from') required String fromDate,
    @Query('sortBy') String sortBy = 'publishedAt',
    @Query('pageSize') int pageSize = 20,
    @Query('page') int page = 1,
    @Query('apiKey') String apiKey = '9c337956eae7413bbc102eb80bc23327',
  });
}
