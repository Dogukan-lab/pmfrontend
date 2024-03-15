import 'package:flutter/material.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({super.key});

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Username'),
        TextField(
          controller: _usernameController,
        ),
        const Text('Password'),
        TextField(
          controller: _passwordController,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
      ],
    );
  }
}
