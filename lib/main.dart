import 'package:flutter/material.dart';
import 'package:pmfrontend/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pale Messenger',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: LoginPage(),
      ),
    ),
  );
}
