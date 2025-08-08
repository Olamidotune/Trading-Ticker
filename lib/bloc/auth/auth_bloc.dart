import 'package:bloc/bloc.dart';
import 'package:cointicker/enums/validation_error.dart';
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

  AuthBloc(this._auth) : super(AuthState()) {
    on<_SignUp>(_signUp);
    on<_SignUpSuccess>(_signUpSuccess);
    on<_SignUpFailure>(_signUpFailure);
    on<_SignIn>(_signIn);
    on<_SignInSuccess>(_signInSuccess);
    on<_SignInFailure>(_signInFailure);
    on<_EmailChanged>(_emailChanged);
    on<_PasswordChanged>(_passwordChanged);
    on<_ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<_FullNameChanged>(_fullNameChanged);
    on<_Init>(_init);
    on<_ErrorMessage>(_errorMessage);

    add(const AuthEvent.init());
  }

  void _init(_Init event, Emitter<AuthState> emit) {
    logInfo('AuthBloc initialized');
  }

  Future<void> _signUp(_SignUp event, Emitter<AuthState> emit) async {
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
      logInfo(state.password.value);

      add(const AuthEvent.signUpSuccess());
    } on FirebaseAuthException catch (error, trace) {
      logError(error, trace);
      add(AuthEvent.signUpFailure(error.message ?? 'Signup failed'));
    }
  }

  void _signUpSuccess(_SignUpSuccess event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      signUpStatus: FormzSubmissionStatus.success,
      errorMessage: null,
    ));
    PersistenceService().saveSignInStatus(true);
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
    ));

    emit(state.copyWith(
      email: const EmailFormz.pure(),
      password: const PasswordFormz.pure(),
    ));

    await PersistenceService().saveSignInStatus(true);
    final signInStatus = await PersistenceService().getSignInStatus();
    logInfo('Sign-in status: $signInStatus');
  }

  void _signInFailure(_SignInFailure event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      signInStatus: FormzSubmissionStatus.failure,
      errorMessage: event.errorMessage,
    ));
  }
}
