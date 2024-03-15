import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({
    super.key,
    required this.usernameChange,
    required this.usernameSubmit,
    required this.passwordChange,
    required this.passwordSubmit,
  });

  final void Function(WidgetRef ref, String text) usernameChange;
  final void Function(WidgetRef ref) usernameSubmit;
  final void Function(WidgetRef ref, String text) passwordChange;
  final void Function(WidgetRef ref) passwordSubmit;

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _usernameController.clear();
    _passwordController.clear();

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
            builder: (_, ref, __) {
              return TextField(
                controller: _usernameController,
                onChanged: (value) => widget.usernameChange(ref, _usernameController.text),
                onSubmitted: (_) {
                  widget.usernameChange(ref, _usernameController.text);
                  widget.usernameSubmit(ref);
                },
                style: Fonts.ggGrey,
                cursorColor: Cols.darkGrey,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
                  border: InputBorder.none,
                ),
              );
            },
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
            builder: (_, ref, __) {
              return TextField(
                controller: _passwordController,
                onChanged: (value) => widget.passwordChange(ref, _passwordController.text),
                onSubmitted: (_) {
                  widget.passwordChange(ref, _passwordController.text);
                  widget.passwordSubmit(ref);
                },
                style: Fonts.ggGrey,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
