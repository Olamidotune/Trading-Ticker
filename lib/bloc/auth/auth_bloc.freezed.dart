// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthEventImplCopyWith<$Res> {
  factory _$$AuthEventImplCopyWith(
          _$AuthEventImpl value, $Res Function(_$AuthEventImpl) then) =
      __$$AuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventImpl>
    implements _$$AuthEventImplCopyWith<$Res> {
  __$$AuthEventImplCopyWithImpl(
      _$AuthEventImpl _value, $Res Function(_$AuthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthEventImpl implements _AuthEvent {
  const _$AuthEventImpl();

  @override
  String toString() {
    return 'AuthEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthEvent implements AuthEvent {
  const factory _AuthEvent() = _$AuthEventImpl;
}

/// @nodoc
abstract class _$$SignUpImplCopyWith<$Res> {
  factory _$$SignUpImplCopyWith(
          _$SignUpImpl value, $Res Function(_$SignUpImpl) then) =
      __$$SignUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpImpl>
    implements _$$SignUpImplCopyWith<$Res> {
  __$$SignUpImplCopyWithImpl(
      _$SignUpImpl _value, $Res Function(_$SignUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpImpl implements _SignUp {
  const _$SignUpImpl();

  @override
  String toString() {
    return 'AuthEvent.signUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return signUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements AuthEvent {
  const factory _SignUp() = _$SignUpImpl;
}

/// @nodoc
abstract class _$$SignUpSuccessImplCopyWith<$Res> {
  factory _$$SignUpSuccessImplCopyWith(
          _$SignUpSuccessImpl value, $Res Function(_$SignUpSuccessImpl) then) =
      __$$SignUpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpSuccessImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpSuccessImpl>
    implements _$$SignUpSuccessImplCopyWith<$Res> {
  __$$SignUpSuccessImplCopyWithImpl(
      _$SignUpSuccessImpl _value, $Res Function(_$SignUpSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpSuccessImpl implements _SignUpSuccess {
  const _$SignUpSuccessImpl();

  @override
  String toString() {
    return 'AuthEvent.signUpSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return signUpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return signUpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class _SignUpSuccess implements AuthEvent {
  const factory _SignUpSuccess() = _$SignUpSuccessImpl;
}

/// @nodoc
abstract class _$$SignUpFailureImplCopyWith<$Res> {
  factory _$$SignUpFailureImplCopyWith(
          _$SignUpFailureImpl value, $Res Function(_$SignUpFailureImpl) then) =
      __$$SignUpFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$SignUpFailureImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpFailureImpl>
    implements _$$SignUpFailureImplCopyWith<$Res> {
  __$$SignUpFailureImplCopyWithImpl(
      _$SignUpFailureImpl _value, $Res Function(_$SignUpFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$SignUpFailureImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpFailureImpl implements _SignUpFailure {
  const _$SignUpFailureImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'AuthEvent.signUpFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpFailureImplCopyWith<_$SignUpFailureImpl> get copyWith =>
      __$$SignUpFailureImplCopyWithImpl<_$SignUpFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return signUpFailure(this.errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return signUpFailure?.call(this.errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUpFailure != null) {
      return signUpFailure(this.errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return signUpFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return signUpFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (signUpFailure != null) {
      return signUpFailure(this);
    }
    return orElse();
  }
}

abstract class _SignUpFailure implements AuthEvent {
  const factory _SignUpFailure(final String errorMessage) = _$SignUpFailureImpl;

  String get errorMessage;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpFailureImplCopyWith<_$SignUpFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
          _$EmailChangedImpl value, $Res Function(_$EmailChangedImpl) then) =
      __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
      _$EmailChangedImpl _value, $Res Function(_$EmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangedImpl implements _EmailChanged {
  const _$EmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements AuthEvent {
  const factory _EmailChanged(final String email) = _$EmailChangedImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(_$PasswordChangedImpl value,
          $Res Function(_$PasswordChangedImpl) then) =
      __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedImpl implements _PasswordChanged {
  const _$PasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements AuthEvent {
  const factory _PasswordChanged(final String password) = _$PasswordChangedImpl;

  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmPasswordChangedImplCopyWith<$Res> {
  factory _$$ConfirmPasswordChangedImplCopyWith(
          _$ConfirmPasswordChangedImpl value,
          $Res Function(_$ConfirmPasswordChangedImpl) then) =
      __$$ConfirmPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String confirmPassword});
}

/// @nodoc
class __$$ConfirmPasswordChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ConfirmPasswordChangedImpl>
    implements _$$ConfirmPasswordChangedImplCopyWith<$Res> {
  __$$ConfirmPasswordChangedImplCopyWithImpl(
      _$ConfirmPasswordChangedImpl _value,
      $Res Function(_$ConfirmPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPassword = null,
  }) {
    return _then(_$ConfirmPasswordChangedImpl(
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmPasswordChangedImpl implements _ConfirmPasswordChanged {
  const _$ConfirmPasswordChangedImpl(this.confirmPassword);

  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'AuthEvent.confirmPasswordChanged(confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordChangedImpl &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPasswordChangedImplCopyWith<_$ConfirmPasswordChangedImpl>
      get copyWith => __$$ConfirmPasswordChangedImplCopyWithImpl<
          _$ConfirmPasswordChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return confirmPasswordChanged(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return confirmPasswordChanged?.call(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return confirmPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return confirmPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _ConfirmPasswordChanged implements AuthEvent {
  const factory _ConfirmPasswordChanged(final String confirmPassword) =
      _$ConfirmPasswordChangedImpl;

  String get confirmPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmPasswordChangedImplCopyWith<_$ConfirmPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FullNameChangedImplCopyWith<$Res> {
  factory _$$FullNameChangedImplCopyWith(_$FullNameChangedImpl value,
          $Res Function(_$FullNameChangedImpl) then) =
      __$$FullNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fullName});
}

/// @nodoc
class __$$FullNameChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FullNameChangedImpl>
    implements _$$FullNameChangedImplCopyWith<$Res> {
  __$$FullNameChangedImplCopyWithImpl(
      _$FullNameChangedImpl _value, $Res Function(_$FullNameChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
  }) {
    return _then(_$FullNameChangedImpl(
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FullNameChangedImpl implements _FullNameChanged {
  const _$FullNameChangedImpl(this.fullName);

  @override
  final String fullName;

  @override
  String toString() {
    return 'AuthEvent.fullNameChanged(fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullNameChangedImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FullNameChangedImplCopyWith<_$FullNameChangedImpl> get copyWith =>
      __$$FullNameChangedImplCopyWithImpl<_$FullNameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return fullNameChanged(fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return fullNameChanged?.call(fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (fullNameChanged != null) {
      return fullNameChanged(fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return fullNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return fullNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (fullNameChanged != null) {
      return fullNameChanged(this);
    }
    return orElse();
  }
}

abstract class _FullNameChanged implements AuthEvent {
  const factory _FullNameChanged(final String fullName) = _$FullNameChangedImpl;

  String get fullName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FullNameChangedImplCopyWith<_$FullNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'AuthEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements AuthEvent {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$ErrorMessageImplCopyWith<$Res> {
  factory _$$ErrorMessageImplCopyWith(
          _$ErrorMessageImpl value, $Res Function(_$ErrorMessageImpl) then) =
      __$$ErrorMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ErrorMessageImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ErrorMessageImpl>
    implements _$$ErrorMessageImplCopyWith<$Res> {
  __$$ErrorMessageImplCopyWithImpl(
      _$ErrorMessageImpl _value, $Res Function(_$ErrorMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ErrorMessageImpl(
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorMessageImpl implements _ErrorMessage {
  const _$ErrorMessageImpl([this.errorMessage]);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthEvent.errorMessage(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMessageImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      __$$ErrorMessageImplCopyWithImpl<_$ErrorMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() signUp,
    required TResult Function() signUpSuccess,
    required TResult Function(String errorMessage) signUpFailure,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String fullName) fullNameChanged,
    required TResult Function() init,
    required TResult Function(String? errorMessage) errorMessage,
  }) {
    return errorMessage(this.errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? signUp,
    TResult? Function()? signUpSuccess,
    TResult? Function(String errorMessage)? signUpFailure,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String fullName)? fullNameChanged,
    TResult? Function()? init,
    TResult? Function(String? errorMessage)? errorMessage,
  }) {
    return errorMessage?.call(this.errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? signUp,
    TResult Function()? signUpSuccess,
    TResult Function(String errorMessage)? signUpFailure,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String fullName)? fullNameChanged,
    TResult Function()? init,
    TResult Function(String? errorMessage)? errorMessage,
    required TResult orElse(),
  }) {
    if (errorMessage != null) {
      return errorMessage(this.errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthEvent value) $default, {
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_SignUpSuccess value) signUpSuccess,
    required TResult Function(_SignUpFailure value) signUpFailure,
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_PasswordChanged value) passwordChanged,
    required TResult Function(_ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_Init value) init,
    required TResult Function(_ErrorMessage value) errorMessage,
  }) {
    return errorMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthEvent value)? $default, {
    TResult? Function(_SignUp value)? signUp,
    TResult? Function(_SignUpSuccess value)? signUpSuccess,
    TResult? Function(_SignUpFailure value)? signUpFailure,
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_PasswordChanged value)? passwordChanged,
    TResult? Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_Init value)? init,
    TResult? Function(_ErrorMessage value)? errorMessage,
  }) {
    return errorMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthEvent value)? $default, {
    TResult Function(_SignUp value)? signUp,
    TResult Function(_SignUpSuccess value)? signUpSuccess,
    TResult Function(_SignUpFailure value)? signUpFailure,
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_PasswordChanged value)? passwordChanged,
    TResult Function(_ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_Init value)? init,
    TResult Function(_ErrorMessage value)? errorMessage,
    required TResult orElse(),
  }) {
    if (errorMessage != null) {
      return errorMessage(this);
    }
    return orElse();
  }
}

abstract class _ErrorMessage implements AuthEvent {
  const factory _ErrorMessage([final String? errorMessage]) =
      _$ErrorMessageImpl;

  String? get errorMessage;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorMessageImplCopyWith<_$ErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  FormzSubmissionStatus get signUpStatus => throw _privateConstructorUsedError;
  EmailFormz get email => throw _privateConstructorUsedError;
  PasswordFormz get password => throw _privateConstructorUsedError;
  ConfirmPasswordFormz get confirmPassword =>
      throw _privateConstructorUsedError;
  FullNameFormz get fullName => throw _privateConstructorUsedError;
  FocusNode? get confirmPasswordFocusNode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus signUpStatus,
      EmailFormz email,
      PasswordFormz password,
      ConfirmPasswordFormz confirmPassword,
      FullNameFormz fullName,
      FocusNode? confirmPasswordFocusNode,
      String? name,
      String? errorMessage});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpStatus = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? fullName = null,
    Object? confirmPasswordFocusNode = freezed,
    Object? name = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      signUpStatus: null == signUpStatus
          ? _value.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailFormz,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordFormz,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordFormz,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullNameFormz,
      confirmPasswordFocusNode: freezed == confirmPasswordFocusNode
          ? _value.confirmPasswordFocusNode
          : confirmPasswordFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus signUpStatus,
      EmailFormz email,
      PasswordFormz password,
      ConfirmPasswordFormz confirmPassword,
      FullNameFormz fullName,
      FocusNode? confirmPasswordFocusNode,
      String? name,
      String? errorMessage});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signUpStatus = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? fullName = null,
    Object? confirmPasswordFocusNode = freezed,
    Object? name = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthStateImpl(
      signUpStatus: null == signUpStatus
          ? _value.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailFormz,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordFormz,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordFormz,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullNameFormz,
      confirmPasswordFocusNode: freezed == confirmPasswordFocusNode
          ? _value.confirmPasswordFocusNode
          : confirmPasswordFocusNode // ignore: cast_nullable_to_non_nullable
              as FocusNode?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  _$AuthStateImpl(
      {this.signUpStatus = FormzSubmissionStatus.initial,
      this.email = const EmailFormz.pure(),
      this.password = const PasswordFormz.pure(),
      this.confirmPassword = const ConfirmPasswordFormz.pure(),
      this.fullName = const FullNameFormz.pure(),
      this.confirmPasswordFocusNode,
      this.name,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus signUpStatus;
  @override
  @JsonKey()
  final EmailFormz email;
  @override
  @JsonKey()
  final PasswordFormz password;
  @override
  @JsonKey()
  final ConfirmPasswordFormz confirmPassword;
  @override
  @JsonKey()
  final FullNameFormz fullName;
  @override
  final FocusNode? confirmPasswordFocusNode;
  @override
  final String? name;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState(signUpStatus: $signUpStatus, email: $email, password: $password, confirmPassword: $confirmPassword, fullName: $fullName, confirmPasswordFocusNode: $confirmPasswordFocusNode, name: $name, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.signUpStatus, signUpStatus) ||
                other.signUpStatus == signUpStatus) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(
                    other.confirmPasswordFocusNode, confirmPasswordFocusNode) ||
                other.confirmPasswordFocusNode == confirmPasswordFocusNode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signUpStatus, email, password,
      confirmPassword, fullName, confirmPasswordFocusNode, name, errorMessage);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  factory _AuthState(
      {final FormzSubmissionStatus signUpStatus,
      final EmailFormz email,
      final PasswordFormz password,
      final ConfirmPasswordFormz confirmPassword,
      final FullNameFormz fullName,
      final FocusNode? confirmPasswordFocusNode,
      final String? name,
      final String? errorMessage}) = _$AuthStateImpl;
  _AuthState._() : super._();

  @override
  FormzSubmissionStatus get signUpStatus;
  @override
  EmailFormz get email;
  @override
  PasswordFormz get password;
  @override
  ConfirmPasswordFormz get confirmPassword;
  @override
  FullNameFormz get fullName;
  @override
  FocusNode? get confirmPasswordFocusNode;
  @override
  String? get name;
  @override
  String? get errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
