import 'dart:async';

import 'package:example/flow/events/authen_event.dart';
import 'package:example/flow/events/order_event.dart';
import 'package:example/flow/state/order_state.dart';
import 'package:example/src/until/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/authen_state.dart';
import '../../src/until/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
AuthenState authenState = {} as AuthenState;


class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  AuthenBloc():super(AuthenState()){
    on<LoginEvent>(handleLoginEvent);
    
  }

  

  FutureOr<void> handleLoginEvent(LoginEvent event, Emitter<AuthenState> emit) async {
    try {
      var url = Uri.https('reqres.in', '/api/login');
      final response = await http.post(url, body: {
        'email': event.email,
        'password': event.password,
      });
      //print("login response: $response" );
      //const storage = FlutterSecureStorage();
     // await storage.write(key: 'token', value: response.token.toString());
      emit(LoginStateSuccess(data: response));
    } catch (e) {
      emit(LoginStateFail(e.toString()));
    }
  }

  
}


