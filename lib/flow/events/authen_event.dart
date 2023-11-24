
class AuthenEvent {
  AuthenEvent();
}

class LoginEvent extends AuthenEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}