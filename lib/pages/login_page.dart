import 'package:flutter/material.dart';
import 'package:pmfrontend/widgets/login/login_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.grey,
            child: Column(
              children: [
                const Text('Pale Messenger'),
                LoginInputs(),
              ],
            ),
          ),
        ),
        const Expanded(flex: 8, child: SizedBox.shrink())
      ],
    );
  }
}
