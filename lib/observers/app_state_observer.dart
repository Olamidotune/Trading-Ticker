import 'dart:async';

import 'package:cointicker/bloc/crypto/crypto_bloc.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class AppStateObserver with WidgetsBindingObserver {
  final FirebaseAuth _auth;
  final CryptoBloc _cryptoBloc;
  Timer? _pollingTimer;

  AppStateObserver(this._auth, this._cryptoBloc);

  void init() {
    WidgetsBinding.instance.addObserver(this);
    _startPolling();
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pollingTimer?.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_auth.currentUser != null) {
          _cryptoBloc.add(const CryptoEvent.fetchCoins());
        }
        _startPolling();
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _pausePolling();
        logInfo('Polling paused due to app lifecycle state.');
        break;
    }
  }

  void _startPolling() {
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) {
        if (_auth.currentUser != null &&
            !_cryptoBloc.state.getCoinStatus.isInProgress) {
          _cryptoBloc.add(const CryptoEvent.fetchCoins());
        }
      },
    );
  }

  void _pausePolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }
}
