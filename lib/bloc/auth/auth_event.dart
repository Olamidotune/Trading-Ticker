part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent() = _AuthEvent;
  const factory AuthEvent.init() = _Init;
  const factory AuthEvent.signUp() = _SignUp;
  const factory AuthEvent.signUpSuccess() = _SignUpSuccess;
  const factory AuthEvent.signUpFailure(String errorMessage) = _SignUpFailure;
  const factory AuthEvent.signIn() = _SignIn;
  const factory AuthEvent.signInSuccess() = _SignInSuccess;
  const factory AuthEvent.signInFailure(String errorMessage) = _SignInFailure;
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.emailChanged(String email) = _EmailChanged;
  const factory AuthEvent.forgotPasswordEmailChanged(
      String forgotPasswordEmail) = _ForgotPasswordEmailChanged;
  const factory AuthEvent.passwordChanged(String password) = _PasswordChanged;
  const factory AuthEvent.confirmPasswordChanged(String confirmPassword) =
      _ConfirmPasswordChanged;
  const factory AuthEvent.fullNameChanged(String fullName) = _FullNameChanged;
  const factory AuthEvent.forgotPassword() = _ForgotPassword;
  const factory AuthEvent.forgotPasswordSuccessful() =
      _ForgotPasswordSuccessful;
  const factory AuthEvent.forgotPasswordFailed(String errorMessage) =
      _ForgotPasswordFailed;
  const factory AuthEvent.googleSignIn() = _GoogleSignIn;
  const factory AuthEvent.googleSignInSuccess() = _GoogleSignInSuccess;
  const factory AuthEvent.googleSignInFailure(String errorMessage) =
      _GoogleSignInFailure;
  const factory AuthEvent.errorMessage([String? errorMessage]) = _ErrorMessage;
}
