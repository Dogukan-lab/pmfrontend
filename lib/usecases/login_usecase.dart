import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/DTOs/pm_user.dart';
import 'package:pmfrontend/repositories/server_handler.dart';
import 'package:pmfrontend/states/login_state.dart';

void requestLogin(String username, String password, StateController loginState) async {
  loginState.state = LoginState.waiting;
  final response = await serverRequest('PmUsers', jsonEncode(PmUser(username: 'Lars', password: 'Lars').toJson()));

  if (response.statusCode == HttpStatus.ok)
    print('TO HOME PAGE');
  else
    loginState.state = LoginState.incorrect;
}
