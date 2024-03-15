import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/states/login_state.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Username',
              style: Fonts.trajan,
            ),
            Consumer(
              builder: (_, ref, child) {
                final state = ref.watch(loginStateProvider);

                if (state == LoginState.usernameUnknown || state == LoginState.both) {
                  return child!;
                } else
                  return const SizedBox.shrink();
              },
              child: Text(
                'Username incorrect',
                style: Fonts.trajan.copyWith(color: Cols.red),
              ),
            ),
          ],
        ),

        //Username Field
        Container(
          height: Sizes.small,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Radii.small),
          ),
          child: TextField(
            controller: _usernameController,
            style: Fonts.ggGrey,
            cursorColor: Cols.darkGrey,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
              border: InputBorder.none,
            ),
          ),
        ),

        //Spacer
        const SizedBox(height: Pad.medium),

        //Password Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Password',
              style: Fonts.trajan,
            ),
            Consumer(
              builder: (_, ref, child) {
                final state = ref.watch(loginStateProvider);

                if (state == LoginState.passwordIncorrect || state == LoginState.both) {
                  return child!;
                } else
                  return const SizedBox.shrink();
              },
              child: Text(
                'Password incorrect',
                style: Fonts.trajan.copyWith(color: Cols.red),
              ),
            ),
          ],
        ),

        //Password Field
        Container(
          height: Sizes.small,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Radii.small),
          ),
          child: TextField(
            controller: _passwordController,
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
      ],
    );
  }
}
