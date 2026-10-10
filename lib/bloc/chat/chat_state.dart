part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState(
      {@Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus fetchChatStatus,
      @Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus searchForUserStatus,
      @Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus addUserStatus,
      List<dynamic>? queryResultSet,
      List<dynamic>? tempSearchStore,
      String? value}) = _Initial;
}
