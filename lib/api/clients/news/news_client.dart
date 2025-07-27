import 'package:cointicker/api/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'news_client.g.dart';

@RestApi()
abstract class NewsClient {
  factory NewsClient(Dio dio, {String? baseUrl}) = _NewsClient;

  @GET(
      'https://newsapi.org/v2/everything?q={searchKey}&apiKey=9c337956eae7413bbc102eb80bc23327')
  Future<News> getNews(
    @Path('searchKey') String? searchKey,
  );
}
