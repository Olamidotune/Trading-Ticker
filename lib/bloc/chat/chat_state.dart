part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus fetchChatStatus,
  }) = _Initial;
}
