import 'package:equatable/equatable.dart';
import 'package:example/src/models/food.dart';

class AuthenState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  get message => null;

}



class AuthenStateInitial extends AuthenState {
  final String message = '';
  final dynamic data = '';

  AuthenStateInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [message, data];

}

class LoginStateSuccess extends AuthenState {
  
  final String message = 'LoginStateSuccess';
  final dynamic data;
  LoginStateSuccess({this.data});
  @override
  List<Object?> get props => [message, data];
}



class LoginStateFail extends AuthenState {
  final String message = "LoginStateFail";
  final String err;
  LoginStateFail(this.err);

  @override
  List<Object?> get props => [err];
}



