import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pages/login_page.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/states/page_state.dart';
import 'package:pmfrontend/states/register_state.dart';
import 'package:pmfrontend/widgets/login/login_inputs.dart';
import 'package:pmfrontend/usecases/login_and_register_usecase.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pale Messenger',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Consumer(
            builder: (_, ref, __) {
              final state = ref.watch(pageStateProvider);

              switch (state) {
                case Pages.register:
                  return LoginPage(
                    background: 'backgrounds/registerpage_background.png',
                    inputs: LoginInputs(
                      usernameChange: (ref, text) => ref.read(registerStateProvider.notifier).changeUsername(text),
                      usernameSubmit: (ref) => requestRegistration(ref),
                      passwordChange: (ref, text) => ref.read(registerStateProvider.notifier).changePassword(text),
                      passwordSubmit: (ref) => requestRegistration(ref),
                    ),
                    errorCheck: (ref) => ref.watch(registerStateProvider).registerEnum == RegisterStateEnum.incorrect,
                    isLogin: false,
                  );
                case Pages.home:
                  return const SizedBox.shrink();
                default:
                  return LoginPage(
                    background: 'backgrounds/login_background.png',
                    inputs: LoginInputs(
                      usernameChange: (ref, text) => ref.read(loginStateProvider.notifier).changeUsername(text),
                      usernameSubmit: (ref) => requestLogin(ref),
                      passwordChange: (ref, text) => ref.read(loginStateProvider.notifier).changePassword(text),
                      passwordSubmit: (ref) => requestLogin(ref),
                    ),
                    errorCheck: (ref) => ref.watch(loginStateProvider).loginEnum == LoginStateEnum.incorrect,
                  );
              }
            },
          ),
        ),
      ),
    ),
  );
}
