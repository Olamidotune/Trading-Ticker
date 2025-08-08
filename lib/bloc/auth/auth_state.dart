part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  factory AuthState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus signUpStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus signInStatus,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus forgotPasswordStatus,
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(ForgotPasswordEmailFormz.pure())
    ForgotPasswordEmailFormz forgotPasswordEmail,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(ConfirmPasswordFormz.pure()) ConfirmPasswordFormz confirmPassword,
    @Default(FullNameFormz.pure()) FullNameFormz fullName,
    FocusNode? confirmPasswordFocusNode,
    String? name,
    String? errorMessage,
  }) = _AuthState;

  bool get isSignUpFormValid => Formz.validate([fullName, email, password]);

  bool get isSignInFormValid => Formz.validate([email, password]);

  bool get isForgotPasswordFormValid => Formz.validate([forgotPasswordEmail]);
}

//==============================================================================
// FORMZ -  Full Name
//==============================================================================

class FullNameFormz extends FormzInput<String, ValidationError> {
  const FullNameFormz.pure([super.value = '']) : super.pure();
  const FullNameFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    return null;
  }
}

//==============================================================================
// FORMZ - FORGOT EMAIL
//==============================================================================

class ForgotPasswordEmailFormz extends FormzInput<String, ValidationError> {
  const ForgotPasswordEmailFormz.pure([super.value = '']) : super.pure();
  const ForgotPasswordEmailFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    if (!EmailValidator.validate(value.trim())) {
      return ValidationError.invalid;
    }

    return null;
  }
}

//==============================================================================
// FORMZ -  EMAIL
//==============================================================================

class EmailFormz extends FormzInput<String, ValidationError> {
  const EmailFormz.pure([super.value = '']) : super.pure();
  const EmailFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    if (!EmailValidator.validate(value.trim())) {
      return ValidationError.invalid;
    }

    return null;
  }
}

//==============================================================================
// FORMZ -  PASSWORD
//==============================================================================

class PasswordFormz extends FormzInput<String, ValidationError> {
  const PasswordFormz.pure([super.value = '']) : super.pure();
  const PasswordFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    return null;
  }
}

//==============================================================================
// FORMZ -  CONFIRM PASSWORD
//==============================================================================
class ConfirmPasswordFormz extends FormzInput<String, ValidationError> {
  const ConfirmPasswordFormz.pure([super.value = '', this.password])
      : super.pure();
  const ConfirmPasswordFormz.dirty([super.value = '', this.password])
      : super.dirty();

  final String? password;

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    if (value != password) {
      return ValidationError.invalid;
    }

    return null;
  }
}
