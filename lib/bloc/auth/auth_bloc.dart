import 'dart:async';

import 'package:example/bloc/auth/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../api/index.dart';
import 'auth_state.dart';


AuthState authenState = {} as AuthState;
@singleton
class AuthBloc extends Cubit<AuthState> {
  final _controller = StreamController<AuthState>();

  @factoryMethod
  AuthBloc() : super(AuthState());

  FutureOr<void> handleLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      var res = await DioClient().getAPI('/v4/api/user/login', {});


      emit(LoginStateSuccess(data: {}));
    } catch (e) {
      emit(LoginStateFail(e.toString()));
    }
  }
}
