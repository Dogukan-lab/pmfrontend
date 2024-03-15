import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/usecases/login_and_register_usecase.dart';

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Username Header
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Username',
            style: Fonts.trajan,
          ),
        ),

        //Username Field
        Container(
          height: Sizes.small,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Radii.small),
          ),
          child: Consumer(
            builder: (_, ref, child) => TextField(
              controller: _usernameController,
              onChanged: (value) => ref.read(loginStateProvider.notifier).changeUsername(_usernameController.text),
              onSubmitted: (_) {
                ref.read(loginStateProvider.notifier).changeUsername(_usernameController.text);
                requestLogin(ref);
              },
              style: Fonts.ggGrey,
              cursorColor: Cols.darkGrey,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        //Spacer
        const SizedBox(height: Pad.medium),

        //Password Header
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Password',
            style: Fonts.trajan,
          ),
        ),

        //Password Field
        Container(
          height: Sizes.small,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Radii.small),
          ),
          child: Consumer(
            builder: (_, ref, child) => TextField(
              controller: _passwordController,
              onChanged: (value) => ref.read(loginStateProvider.notifier).changePassword(_passwordController.text),
              onSubmitted: (_) {
                ref.read(loginStateProvider.notifier).changePassword(_passwordController.text);
                requestLogin(ref);
              },
              style: Fonts.ggGrey,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
          ),
        ),
      ],
    );
  }
}
