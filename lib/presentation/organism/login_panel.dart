import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/molecule/login/login_inputs.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/molecule/login/login_buttons.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({
    super.key,
    required this.inputs,
    required this.errorCheck,
    required this.isLogin,
  });

  final LoginInputs inputs;
  final bool Function(WidgetRef ref) errorCheck;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(181, 24, 24, 24),
                  Color.fromARGB(181, 48, 48, 48),
                  Color.fromARGB(181, 67, 67, 67),
                  Color.fromARGB(143, 74, 74, 74),
                  Color.fromARGB(18, 95, 95, 95),
                ],
                stops: [0.0, 0.6233, 0.9027, 0.9752, 1.0],
              ),
            ),
            child: Column(
              children: [
                //Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Pad.large),
                  child: Text(
                    'Pale Messenger',
                    style: Styles.trajan.copyWith(fontSize: 42.5),
                  ),
                ),

                //Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Pad.large),
                  child: inputs,
                ),

                //Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Pad.large, vertical: Pad.mediumPlus),
                  child: LoginButtons(isLogin: isLogin),
                ),

                //Error message
                Consumer(
                  builder: (_, ref, child) => errorCheck(ref) ? child! : const SizedBox.shrink(),
                  child: Text(
                    'Username or password incorrect',
                    style: Styles.trajan.copyWith(color: Cols.red),
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(flex: 4, child: SizedBox.shrink())
      ],
    );
  }
}
