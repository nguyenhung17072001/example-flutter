import 'package:equatable/equatable.dart';


class AuthState extends Equatable   {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  get message => null;
  
}

class AuthStateInitial extends AuthState {
  final String message = '';
  final dynamic data = '';

  AuthStateInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [message, data];

}

class LoginStateSuccess extends AuthState {
  
  final String message = 'LoginSuccess';
  final dynamic data;
  LoginStateSuccess({this.data});
  @override
  List<Object?> get props => [message, data];
}



class LoginStateFail extends AuthState {
  final String message = "LoginFail";
  final String error;
  LoginStateFail(this.error);
  


  @override
  List<Object?> get props => [error];

}