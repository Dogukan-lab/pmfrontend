import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/molecule/login/login_inputs.dart';
import 'package:pmfrontend/presentation/organism/login_panel.dart';

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
            Transform(
              transform: Matrix4.identity()..scale(2.0, 1.0),
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color.fromARGB(45, 226, 149, 93),
                      Colors.black.withOpacity(0.5),
                      // Colors.red.withOpacity(1),
                    ],
                    stops: const [0.5, 1.0],
                    center: Alignment.center,
                    radius: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        LoginPanel(
          inputs: inputs,
          errorCheck: errorCheck,
          isLogin: isLogin,
        )
      ],
    );
  }
}
