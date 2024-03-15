import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginStateEnum {
  none,
  waiting,
  incorrect,
}

class LoginState {
  LoginState({
    this.username = "",
    this.password = "",
    this.loginEnum = LoginStateEnum.none,
  });

  final String username;
  final String password;
  final LoginStateEnum loginEnum;

  LoginState copyWith({String? user, String? pass, LoginStateEnum? stateEnum}) => LoginState(
        username: user ?? username,
        password: pass ?? password,
        loginEnum: stateEnum ?? loginEnum,
      );
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  void changeUsername(String user) => state = state.copyWith(user: user);
  void changePassword(String pass) => state = state.copyWith(pass: pass);
  void changeEnum(LoginStateEnum stateEnum) => state = state.copyWith(stateEnum: stateEnum);
}

final loginStateProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(),
);
