
import 'package:example/model/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


abstract class AuthEvent {
  final User user;
  AuthEvent(this.user);
}


@freezed
class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  LoginEvent({required this.username, required this.password}) : super(User(username: '', token: ''));
  @override
  List<Object> get props => [username, password];
}