import 'package:bloc/bloc.dart';
import 'package:cointicker/enums/validation_error.dart';
import 'package:cointicker/services/google_auth.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth;
  final GoogleSignInService googleSignInService = GoogleSignInService();

  AuthBloc(this._auth) : super(AuthState()) {
    on<_SignUp>(_signUp);
    on<_SignUpSuccess>(_signUpSuccess);
    on<_SignUpFailure>(_signUpFailure);
    on<_SignIn>(_signIn);
    on<_SignInSuccess>(_signInSuccess);
    on<_SignInFailure>(_signInFailure);
    on<_SignOut>(_signOut);
    on<_ForgotPassword>(_forgotPassword);
    on<_ForgotPasswordSuccessful>(_forgotPasswordSuccessful);
    on<_ForgotPasswordFailed>(_forgotPasswordFailed);
    on<_EmailChanged>(_emailChanged);
    on<_ForgotPasswordEmailChanged>(_forgotPasswordEmailChanged);
    on<_PasswordChanged>(_passwordChanged);
    on<_ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<_FullNameChanged>(_fullNameChanged);
    on<_GoogleSignIn>(_googleSignIn);
    on<_GoogleSignInSuccess>(_googleSignInSuccess);
    on<_GoogleSignInFailure>(_googleSignInFailure);
    on<_Init>(_init);
    on<_ErrorMessage>(_errorMessage);

    add(const AuthEvent.init());
  }

  void _init(_Init event, Emitter<AuthState> emit) {
    logInfo('AuthBloc initialized');
    logInfo('User ID:${_auth.currentUser?.uid}');
  }

  void _signUp(_SignUp event, Emitter<AuthState> emit) async {
    if (state.signUpStatus == FormzSubmissionStatus.inProgress) return;

    if (!state.isSignUpFormValid) {
      emit(
        state.copyWith(
          email: EmailFormz.dirty(state.email.value),
          fullName: FullNameFormz.dirty(state.fullName.value),
          password: PasswordFormz.dirty(state.password.value),
          confirmPassword:
              ConfirmPasswordFormz.dirty(state.confirmPassword.value),
          errorMessage: 'Please fill in all fields correctly.',
        ),
      );
      return;
    }

    emit(state.copyWith(signUpStatus: FormzSubmissionStatus.inProgress));

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      // ✅ Update display name
      await userCredential.user?.updateDisplayName(state.fullName.value);

      // ✅ Save additional info to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': state.fullName.value,
        'email': state.email.value,
        'createdAt': FieldValue.serverTimestamp(),
      });

      logInfo('User signed up successfully: ${userCredential.user!.uid}');

      final uid = userCredential.user?.uid;
      final docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      final fullName = docSnapshot.data()?['fullName'];
      await PersistenceService().saveUserName(fullName);

      final userEmail = docSnapshot.data()?['email'];
      await PersistenceService().saveUserEmail(userEmail);

      add(const AuthEvent.signUpSuccess());
    } on FirebaseAuthException catch (error, trace) {
      logError(error, trace);
      add(AuthEvent.signUpFailure(error.message ?? 'Signup failed'));
    }
  }

  void _signUpSuccess(_SignUpSuccess event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      signUpStatus: FormzSubmissionStatus.success,
      errorMessage: null,
      isAuthenticated: true,
    ));
    await PersistenceService().saveSignInStatus(true);
    await PersistenceService().saveHasAuthenticatedBefore(true);
  }

  void _signUpFailure(_SignUpFailure event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      signUpStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }

  void _emailChanged(_EmailChanged event, Emitter<AuthState> emit) {
    final email = EmailFormz.dirty(event.email);

    emit(
      state.copyWith(
        email: email.isValid ? email : EmailFormz.pure(event.email),
      ),
    );
  }

  void _passwordChanged(_PasswordChanged event, Emitter<AuthState> emit) {
    final password = PasswordFormz.dirty(event.password);

    emit(
      state.copyWith(
        password:
            password.isValid ? password : PasswordFormz.pure(event.password),
      ),
    );
  }

  void _confirmPasswordChanged(
      _ConfirmPasswordChanged event, Emitter<AuthState> emit) {
    final confirmPassword = ConfirmPasswordFormz.dirty(event.confirmPassword);

    emit(
      state.copyWith(
        confirmPassword: confirmPassword.isValid
            ? confirmPassword
            : ConfirmPasswordFormz.pure(event.confirmPassword),
      ),
    );
  }

  void _fullNameChanged(_FullNameChanged event, Emitter<AuthState> emit) {
    final fullName = FullNameFormz.dirty(event.fullName);
    emit(
      state.copyWith(
        fullName:
            fullName.isValid ? fullName : FullNameFormz.pure(event.fullName),
      ),
    );
  }

  void _errorMessage(_ErrorMessage event, Emitter<AuthState> emit) {
    emit(state.copyWith(errorMessage: event.errorMessage));
  }

  Future<void> _signIn(_SignIn event, Emitter<AuthState> emit) async {
    if (state.signInStatus == FormzSubmissionStatus.inProgress) return;

    if (!state.isSignInFormValid) {
      emit(
        state.copyWith(
          email: EmailFormz.dirty(state.email.value),
          password: PasswordFormz.dirty(state.password.value),
          errorMessage: 'Please fill in all fields correctly.',
        ),
      );
      return;
    }

    emit(state.copyWith(signInStatus: FormzSubmissionStatus.inProgress));

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      final uid = userCredential.user?.uid;
      final docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      add(const AuthEvent.signInSuccess());

      final fullName = docSnapshot.data()?['fullName'];
      await PersistenceService().saveUserName(fullName);

      final userEmail = docSnapshot.data()?['email'];
      await PersistenceService().saveUserEmail(userEmail);
    } on FirebaseAuthException catch (error, trace) {
      logError(error, trace);
      add(AuthEvent.signInFailure(error.message ?? 'Sign in failed'));
    }
  }

  void _signInSuccess(_SignInSuccess event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      signInStatus: FormzSubmissionStatus.success,
      errorMessage: null,
      isAuthenticated: true,
    ));

    emit(state.copyWith(
      email: const EmailFormz.pure(),
      password: const PasswordFormz.pure(),
    ));

    await PersistenceService().saveSignInStatus(true);
    await PersistenceService().saveHasAuthenticatedBefore(true);
  }

  void _signInFailure(_SignInFailure event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      signInStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }

  void _forgotPasswordEmailChanged(
      _ForgotPasswordEmailChanged event, Emitter<AuthState> emit) {
    final forgotPassword =
        ForgotPasswordEmailFormz.dirty(event.forgotPasswordEmail);

    emit(
      state.copyWith(
          forgotPasswordEmail: forgotPassword.isValid
              ? forgotPassword
              : ForgotPasswordEmailFormz.pure(event.forgotPasswordEmail)),
    );
  }

  void _signOut(_SignOut event, Emitter<AuthState> emit) async {
    await _auth.signOut();
    logInfo('User signed out successfully.');
    await PersistenceService().saveSignInStatus(false);
    await PersistenceService().signOut();
    emit(state.copyWith(isAuthenticated: false));
  }

  void _forgotPassword(_ForgotPassword event, Emitter<AuthState> emit) async {
    if (state.forgotPasswordStatus == FormzSubmissionStatus.inProgress) return;

    if (!state.isForgotPasswordFormValid) {
      emit(
        state.copyWith(
          forgotPasswordEmail:
              ForgotPasswordEmailFormz.dirty(state.forgotPasswordEmail.value),
          errorMessage: 'Invalid Email',
        ),
      );
      return;
    }

    emit(
        state.copyWith(forgotPasswordStatus: FormzSubmissionStatus.inProgress));

    try {
      await _auth.sendPasswordResetEmail(
        email: state.forgotPasswordEmail.value,
      );
      add(const _ForgotPasswordSuccessful());
    } on FirebaseAuthException catch (error, trace) {
      logError(error, trace);
      add(AuthEvent.forgotPasswordFailed(
          error.message ?? 'Send forgot password link failed.'));
    }
  }

  void _forgotPasswordSuccessful(
      _ForgotPasswordSuccessful event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      forgotPasswordStatus: FormzSubmissionStatus.success,
      errorMessage: null,
    ));
  }

  void _forgotPasswordFailed(
      _ForgotPasswordFailed event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      forgotPasswordStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }

  Future<void> _googleSignIn(
      _GoogleSignIn event, Emitter<AuthState> emit) async {
    if (state.googleSignInStatus.isInProgress) return;

    emit(state.copyWith(googleSignInStatus: FormzSubmissionStatus.inProgress));

    try {
      final User? user = await googleSignInService.signInWithGoogle();

      if (user == null) {
        add(const AuthEvent.googleSignInFailure('Google sign-in failed.'));
        return;
      }

      add(const AuthEvent.googleSignInSuccess());
      logInfo('Google sign-in successful: ${user.email}');
    } catch (error, trace) {
      logError('Google sign-in error: $error', trace);
      add(AuthEvent.googleSignInFailure(error.toString()));
    }
  }

  void _googleSignInSuccess(
      _GoogleSignInSuccess event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      googleSignInStatus: FormzSubmissionStatus.success,
      errorMessage: null,
      isAuthenticated: true,
    ));

    await PersistenceService().saveSignInStatus(true);
    await PersistenceService().saveHasAuthenticatedBefore(true);
  }

  void _googleSignInFailure(
      _GoogleSignInFailure event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      googleSignInStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }
}
