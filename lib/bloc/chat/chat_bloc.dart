import 'package:bloc/bloc.dart';
import 'package:cointicker/services/search_user.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<_SearchUser>(_searchUser);
    on<_SearchUserSuccessful>(_searchUserSuccessful);
    on<_SearchUserFailed>(_searchUserFailed);
  }

  void _searchUser(
    _SearchUser event,
    Emitter<ChatState> emit,
  ) async {
    final value = event.value?.trim() ?? '';

    if (value.isEmpty) {
      emit(
        state.copyWith(
          tempSearchStore: [],
          queryResultSet: [],
          searchForUserStatus: FormzSubmissionStatus.initial,
        ),
      );
      return;
    }

    final capValue = value.substring(0, 1).toUpperCase() + value.substring(1);

    try {
      // First character → fetch users from Firestore
      if (value.length == 1) {
        emit(
          state.copyWith(
            searchForUserStatus: FormzSubmissionStatus.inProgress,
          ),
        );

        final docs = await SearchUser().search(value);

        final results =
            docs.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

        emit(
          state.copyWith(
            queryResultSet: results,
            tempSearchStore: results,
            searchForUserStatus: FormzSubmissionStatus.success,
          ),
        );

        return;
      }

      // Subsequent characters → filter existing results
      final results = state.queryResultSet?.where((element) {
            return (element['userName'] as String?)?.startsWith(capValue) ??
                false;
          }).toList() ??
          [];

      emit(
        state.copyWith(
          tempSearchStore: results,
          searchForUserStatus: FormzSubmissionStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          searchForUserStatus: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void _searchUserSuccessful(
      _SearchUserSuccessful event, Emitter<ChatState> emit) {}

  void _searchUserFailed(_SearchUserFailed event, Emitter<ChatState> emit) {}
}
