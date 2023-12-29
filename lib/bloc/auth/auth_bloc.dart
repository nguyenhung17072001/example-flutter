import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:example/bloc/auth/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../api/index.dart';
import 'auth_state.dart';


AuthState authenState = {} as AuthState;
@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {

  @factoryMethod
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(handleLoginEvent);
  }

  FutureOr<void> handleLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      /* var res = await DioClient().postAPI('/v4/api/user/login', {
        'email': event.username,
        'password': event.password,
      }); */
      var res = await HttpUtil().post('/v4/api/user/login', {
        'username': event.username,
        'password': event.password,
      });
      /* var url = Uri.https('reqres.in', '/api/login');
      final res = await http.post(url, body: {
        'email': 'eve.holt@reqres.in',
        'password': event.password,
      }); */
      print('zzzzzzzzzzzzz: $res');
      

      emit(LoginStateSuccess(data: res));
    } catch (e) {
      print('lỗi: $e');
      emit(LoginStateFail(e.toString()));
    }
  }
}
