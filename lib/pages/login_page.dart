import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/widgets/login/login_buttons.dart';
import 'package:pmfrontend/widgets/login/login_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.background,
    required this.inputs,
    required this.errorCheck,
    this.isLogin = true,
  });

  final String background;
  final LoginInputs inputs;
  final bool Function(WidgetRef ref) errorCheck;
  final bool isLogin;

  /*
  Stack
    Stack
      Background image
      Gradient (with transform)
    Row
      Column with container for gradient
        Pale Messenger header
        Login Inputs
      Empty expanded for flex
  **/

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              background,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              transform: Matrix4.identity()..scale(2.0, 1.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color.fromARGB(90, 226, 149, 93),
                    Colors.black.withOpacity(0.5),
                  ],
                  stops: const [0.5, 1.0],
                  center: Alignment.center,
                  radius: 0.5,
                ),
              ),
            ),
          ],
        ),
        Row(
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
                        style: Fonts.trajan.copyWith(fontSize: 42.5),
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
                        style: Fonts.trajan.copyWith(color: Cols.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(flex: 4, child: SizedBox.shrink())
          ],
        ),
      ],
    );
  }
}
