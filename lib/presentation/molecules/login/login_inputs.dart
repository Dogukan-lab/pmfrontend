import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/tools/custom_textfield.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class LoginInputs extends StatefulWidget {
  const LoginInputs({
    super.key,
    required this.isLogin,
    required this.usernameChange,
    required this.usernameSubmit,
    required this.passwordChange,
    required this.passwordSubmit,
  });

  final bool isLogin;
  final void Function(WidgetRef ref, String text) usernameChange;
  final void Function(WidgetRef ref) usernameSubmit;
  final void Function(WidgetRef ref, String text) passwordChange;
  final void Function(WidgetRef ref) passwordSubmit;

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
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
            style: Styles.trajan,
          ),
        ),

        //Username Field
        Consumer(
          builder: (_, ref, __) {
            return CustomTextField(
              key: ValueKey(widget.isLogin),
              backgroundColor: Colors.white,
              style: Styles.ggGrey,
              init: (controller) => controller.clear(),
              onChanged: (value) => widget.usernameChange(ref, value),
              onSubmitted: (value) {
                widget.usernameChange(ref, value);
                widget.usernameSubmit(ref);
              },
            );
          },
        ),

        //Spacer
        const SizedBox(height: Pad.medium),

        //Password Header
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Password',
            style: Styles.trajan,
          ),
        ),

        //Password Field
        Consumer(
          builder: (_, ref, __) {
            return CustomTextField(
              key: ValueKey(widget.isLogin),
              backgroundColor: Colors.white,
              style: Styles.ggGrey,
              obscure: true,
              init: (controller) => controller.clear(),
              onChanged: (value) => widget.passwordChange(ref, value),
              onSubmitted: (value) {
                widget.passwordChange(ref, value);
                widget.passwordSubmit(ref);
              },
            );
          },
        ),
      ],
    );
  }
}
