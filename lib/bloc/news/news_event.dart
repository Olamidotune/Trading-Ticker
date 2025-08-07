part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent() = _NewsEvent;
  const factory NewsEvent.init() = _Init;
  const factory NewsEvent.fetchNews(
    String? searchKey,
    int page,
    String? fromDate,
  ) = _FetchNews;
  const factory NewsEvent.fetchNewsSuccess(News news) = _FetchNewsSuccess;
  const factory NewsEvent.fetchNewsFailure([String? errorMessage]) =
      _FetchNewsFailure;
}
