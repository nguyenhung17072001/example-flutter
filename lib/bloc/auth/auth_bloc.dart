import 'dart:async';

import 'package:example/bloc/auth/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@singleton
class AuthBloc extends Cubit<AuthState> {
  //final StreamController<void> handleLogin = StreamController();

  @factoryMethod
  AuthBloc() : super(AuthState());

  FutureOr<void> handleLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      
      emit(LoginStateSuccess(data: {}));
    } catch (e) {
      emit(LoginStateFail(e.toString()));
    }
  }
}
