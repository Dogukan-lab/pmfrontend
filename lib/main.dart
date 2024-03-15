import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pages/login_page.dart';
import 'package:pmfrontend/pages/register_page.dart';
import 'package:pmfrontend/states/page_state.dart';

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
                  return const RegisterPage();
                case Pages.home:
                  return const SizedBox.shrink();
                default:
                  return const LoginPage();
              }
            },
          ),
        ),
      ),
    ),
  );
}
