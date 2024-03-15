import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/DTOs/pm_user.dart';
import 'package:pmfrontend/repositories/server_handler.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/states/register_state.dart';

void requestLogin(WidgetRef ref) async {
  final loginNotifier = ref.read(loginStateProvider.notifier);
  final loginState = ref.read(loginStateProvider);

  loginNotifier.changeEnum(LoginStateEnum.waiting);

  final response = await serverRequest(
    'PmUsers',
    jsonEncode(PmUser(
      username: loginState.username,
      password: loginState.password,
    ).toJson()),
  );

  if (response != null && response.statusCode == HttpStatus.ok) {
    print('TO HOME PAGE');
    loginNotifier.changeEnum(LoginStateEnum.none);
  } else
    loginNotifier.changeEnum(LoginStateEnum.incorrect);
}

void requestRegistration(WidgetRef ref) async {
  final registerNotifier = ref.read(registerStateProvider.notifier);
  final registerState = ref.read(registerStateProvider);

  print(registerState.username);
  print(registerState.password);
  print('----');
}
