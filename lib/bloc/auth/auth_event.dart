part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent() = _AuthEvent;
  const factory AuthEvent.signUp() = _SignUp;
  const factory AuthEvent.signUpSuccess() = _SignUpSuccess;
  const factory AuthEvent.signUpFailure(String errorMessage) = _SignUpFailure;
  const factory AuthEvent.emailChanged(String email) = _EmailChanged;
  const factory AuthEvent.passwordChanged(String password) = _PasswordChanged;
  const factory AuthEvent.confirmPasswordChanged(String confirmPassword) =
      _ConfirmPasswordChanged;
  const factory AuthEvent.fullNameChanged(String fullName) = _FullNameChanged;
  const factory AuthEvent.init() = _Init;
  const factory AuthEvent.errorMessage([String? errorMessage]) = _ErrorMessage;
}
