part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent() = _ChatEvent;
  const factory ChatEvent.init() = _Initialized;

  const factory ChatEvent.searchUser(String? value) = _SearchUser;
  const factory ChatEvent.searchUserSuccessful() = _SearchUserSuccessful;
  const factory ChatEvent.searchUserFailed() = _SearchUserFailed;
}
