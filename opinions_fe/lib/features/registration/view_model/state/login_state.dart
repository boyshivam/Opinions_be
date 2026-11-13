import 'package:opinions/features/registration/enums/login_status_enums.dart';

class LoginState {
  const LoginState({
    required this.username,
    required this.password,
    required this.loginState,
  });

  final String username;
  final String password;
  final LoginStatusEnums loginState;

  LoginState copyWith({
    String? username,
    String? password,
    LoginStatusEnums? loginState,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginState: loginState ?? this.loginState,
    );
  }
}
