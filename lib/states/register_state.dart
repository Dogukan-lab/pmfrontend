import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RegisterStateEnum {
  none,
  waiting,
  incorrect,
}

class RegisterState {
  RegisterState({
    this.username = "",
    this.password = "",
    this.registerEnum = RegisterStateEnum.none,
  });

  final String username;
  final String password;
  final RegisterStateEnum registerEnum;

  RegisterState copyWith({String? user, String? pass, RegisterStateEnum? stateEnum}) => RegisterState(
        username: user ?? username,
        password: pass ?? password,
        registerEnum: stateEnum ?? registerEnum,
      );
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier() : super(RegisterState());

  void changeUsername(String user) => state = state.copyWith(user: user);
  void changePassword(String pass) => state = state.copyWith(pass: pass);
  void changeEnum(RegisterStateEnum stateEnum) => state = state.copyWith(stateEnum: stateEnum);
}

final registerStateProvider = StateNotifierProvider<RegisterStateNotifier, RegisterState>(
  (ref) => RegisterStateNotifier(),
);
