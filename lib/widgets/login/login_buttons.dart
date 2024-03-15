import 'package:flutter/material.dart';
import 'package:pmfrontend/pale_themes.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => print("Login"),
          child: Container(
            decoration: BoxDecoration(
              color: Cols.darkGrey,
              borderRadius: BorderRadius.circular(Radii.small),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Pad.smallPlus, vertical: Pad.smallMinus),
              child: Text(
                'Login',
                style: Fonts.trajan,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => print("Register"),
          child: Container(
            decoration: BoxDecoration(
              color: Cols.darkGrey,
              borderRadius: BorderRadius.circular(Radii.small),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Pad.smallPlus, vertical: Pad.smallMinus),
              child: Text(
                'Register',
                style: Fonts.trajan,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
