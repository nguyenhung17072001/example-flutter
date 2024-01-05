

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;



class BiometricUtils {
  static final BiometricUtils instance = BiometricUtils._getInstance();
  BiometricUtils._getInstance();


  final LocalAuthentication _localAuth = LocalAuthentication();
  
  Future<bool> checkBiometrics ()async {
    final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
    final bool canAuthenticate =
      canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
    return canAuthenticate;
  }

  Future authenticate() async {
    Completer completer = Completer();
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(useErrorDialogs: true)
      );
      completer.complete(authenticated);
    } on PlatformException catch (e) {
      completer.completeError(e);
    }
  } 

  Future getBiometrics () async {
    Completer completer = Completer();
    try {
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        /* authMessages: const[
          AndroidAuthMessages()
        ] */
      );
        completer.complete(didAuthenticate);
    } on PlatformException catch (e) {
      completer.completeError(e);
    }
  }


}