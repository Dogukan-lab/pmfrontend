import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pages/login_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pale Messenger',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: LoginPage(),
        ),
      ),
    ),
  );
}
