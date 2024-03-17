import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/DTOs/pm_user.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/login_state.dart';
import 'package:pmfrontend/presentation/states/page_state.dart';
import 'package:pmfrontend/presentation/states/profile_state.dart';
import 'package:pmfrontend/presentation/states/register_state.dart';

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

  ref.read(profileProvider.notifier).loadProfile(ProfileState(
        profile: Profile(
          registerState.username,
          'Hi I\'m new!',
          0,
          true,
        ),
        background: 0,
        friends: [],
      ));

  if (response != null && response.statusCode == HttpStatus.ok) {
    ref.read(pageProvider.notifier).setPage(ref, Pages.home);
  } else {
    registerNotifier.changeEnum(RegisterStateEnum.incorrect);
    await Future.delayed(const Duration(seconds: 2));
    registerNotifier.changeEnum(RegisterStateEnum.none);
  }
}
