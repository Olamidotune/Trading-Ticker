part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent() = _ChatEvent;
  const factory ChatEvent.init() = _Initialized;

  const factory ChatEvent.createNewChat() = _CreateNewChat;
}
