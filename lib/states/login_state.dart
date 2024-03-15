import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginState {
  none,
  waiting,
  usernameUnknown,
  passwordIncorrect,
  both,
}

final StateProvider<LoginState> loginStateProvider = StateProvider<LoginState>((ref) => LoginState.none);
