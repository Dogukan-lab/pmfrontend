import 'package:flutter/material.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/widgets/login/login_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Image.asset(
              'backgrounds/login_background.png',
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
                      const Color.fromARGB(90, 226, 149, 93),
                      Colors.black.withOpacity(0.5),
                    ],
                    stops: const [0.5, 1.0],
                    center: Alignment.center,
                    radius: 0.5,
                  ),
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
                    // stops: [0.0, 0.6233, 0.7027, 0.8752, 1.0], //better?
                    stops: [0.0, 0.6233, 0.9027, 0.9752, 1.0],
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Pale Messenger',
                      style: trajan,
                    ),
                    LoginInputs(),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 5, child: SizedBox.shrink())
          ],
        ),
      ],
    );
  }
}
