import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/DTOs/pm_user.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/presentation/states/login/login_state.dart';
import 'package:pmfrontend/presentation/states/page_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';
import 'package:pmfrontend/presentation/states/login/register_state.dart';

void requestLogin(WidgetRef ref) async {
  final loginNotifier = ref.read(loginProvider.notifier);
  final loginState = ref.read(loginProvider);

  loginNotifier.changeEnum(LoginStateEnum.waiting);

  final response = await serverRequest(
    'PmAuth/Login',
    jsonEncode(PmUser(
      username: loginState.username,
      password: loginState.password,
    ).toJson()),
  );

  if (response != null && response.statusCode == HttpStatus.ok) {
    ref.read(pageProvider.notifier).setPage(ref, Pages.home);
    ref.read(profileProvider.notifier).loadProfile(parseLoginJson(response.body));
  } else {
    loginNotifier.changeEnum(LoginStateEnum.incorrect);
    await Future.delayed(const Duration(seconds: 2));
    loginNotifier.changeEnum(LoginStateEnum.none);
  }
}

void requestRegistration(WidgetRef ref) async {
  final registerNotifier = ref.read(registerProvider.notifier);
  final registerState = ref.read(registerProvider);

  final response = await serverRequest(
    'PmAuth/Register',
    jsonEncode(PmUser(
      username: registerState.username,
      password: registerState.password,
    ).toJson()),
  );

  if (response != null && response.statusCode == HttpStatus.ok) {
    ref.read(pageProvider.notifier).setPage(ref, Pages.home);
    ref.read(profileProvider.notifier).loadProfile(parseLoginJson(response.body));
  } else {
    registerNotifier.changeEnum(RegisterStateEnum.incorrect);
    await Future.delayed(const Duration(seconds: 2));
    registerNotifier.changeEnum(RegisterStateEnum.none);
  }
}

ProfileState parseLoginJson(String jsonString) {
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  ProfileState state = ProfileState.fromJson(jsonMap);
  return state;
}
