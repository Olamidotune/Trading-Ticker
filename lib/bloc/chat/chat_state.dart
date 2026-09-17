part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({String? uid}) = _Initial;
}
