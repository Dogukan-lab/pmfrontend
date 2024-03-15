import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/usecases/login_usecase.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (_, ref, child) => GestureDetector(
            onTap: () => requestLogin(ref),
            child: Container(
              decoration: BoxDecoration(
                color: Cols.darkGrey,
                borderRadius: BorderRadius.circular(Radii.small),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Pad.smallPlus, vertical: Pad.smallMinus),
                child: Row(
                  children: [
                    const Text(
                      'Login',
                      style: Fonts.trajan,
                    ),
                    if (ref.watch(loginStateProvider).loginEnum == LoginStateEnum.waiting)
                      const Padding(
                        padding: EdgeInsets.only(left: Pad.small),
                        child: SizedBox(
                          width: Sizes.smallMinus,
                          height: Sizes.smallMinus,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        ),
                      ),
                  ],
                ),
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
