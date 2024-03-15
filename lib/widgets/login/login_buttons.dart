import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/states/login_state.dart';
import 'package:pmfrontend/states/page_state.dart';
import 'package:pmfrontend/usecases/login_and_register_usecase.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key, this.isLogin = true});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (_, ref, child) => GestureDetector(
            onTap: () => isLogin ? requestLogin(ref) : ref.read(pageStateProvider.notifier).state = Pages.login,
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
                    Text(
                      isLogin ? 'Login' : 'back',
                      style: Fonts.trajan,
                    ),
                    if (isLogin && ref.watch(loginStateProvider).loginEnum == LoginStateEnum.waiting)
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
        Consumer(
          builder: (_, ref, child) => GestureDetector(
            onTap: () => isLogin ? ref.read(pageStateProvider.notifier).state = Pages.register : requestRegistration(ref),
            child: child,
          ),
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
