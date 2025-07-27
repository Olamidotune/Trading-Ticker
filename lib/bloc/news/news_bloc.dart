import 'package:bloc/bloc.dart';
import 'package:cointicker/api/clients/news/news_client.dart';
import 'package:cointicker/api/models/news_model.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState()) {
    on<_Init>(_init);
    on<_FetchNews>(_fetchNews);
    on<_FetchNewsSuccess>(_fetchNewsSuccess);
    on<_FetchNewsFailure>(_fetchNewsFailure);

    add(const NewsEvent.init());
  }

  void _init(_Init event, Emitter<NewsState> emit) {
    logInfo('NewsBloc initialized');

    emit(state.copyWith(getNewsStatus: FormzSubmissionStatus.initial));
    add(NewsEvent.fetchNews(state.searchKey ?? 'Cryptocurrency'));
  }

  void _fetchNews(_FetchNews event, Emitter<NewsState> emit) async {
    if (state.getNewsStatus.isInProgress) return;

    emit(state.copyWith(getNewsStatus: FormzSubmissionStatus.inProgress));

    try {
      final news = await locator<NewsClient>()
          .getNews(event.searchKey ?? 'Cryptocurrency');

      add(_FetchNewsSuccess(news));
    } catch (error, trace) {
      logError(error, trace);
      // add(_FetchNewsFailure(error.toString()));

      if (error is DioException) {
        final message = error.response?.data?['message'];
        add(_FetchNewsFailure(message?.toString() ?? 'Something went wrong'));
      } else {
        add(const _FetchNewsFailure('Something went wrong'));
      }
    }
  }

  void _fetchNewsSuccess(_FetchNewsSuccess event, Emitter<NewsState> emit) {
    emit(state.copyWith(
      getNewsStatus: FormzSubmissionStatus.success,
      news: event.news.articles,
      errorMessage: null,
    ));
    logInfo('News fetched successfully');
  }

  void _fetchNewsFailure(_FetchNewsFailure event, Emitter<NewsState> emit) {
    emit(state.copyWith(
      getNewsStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage ?? 'Failed to fetch news',
    ));
  }
}
