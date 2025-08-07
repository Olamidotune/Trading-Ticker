part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const NewsState._();
  factory NewsState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus getNewsStatus,
    List<Article>? news,
    String? searchKey,
    @Default(1) int page,
    String? errorMessage,
  }) = _NewsState;
}
