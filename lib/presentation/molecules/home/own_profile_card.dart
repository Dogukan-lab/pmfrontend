import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/profile_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final settingsState = StateProvider<bool>((ref) => false);

class OwnProfileCard extends StatelessWidget {
  const OwnProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return GestureDetector(
          onTap: () {
            final notifier = ref.read(settingsState.notifier);
            notifier.state = !notifier.state;
          },
          child: child!,
        );
      },
      child: Container(
        height: Sizes.medium,
        color: Cols.grey29,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //ProfileCard
            Padding(
              padding: const EdgeInsets.only(left: Pad.small),
              child: Consumer(
                builder: (_, ref, __) {
                  final state = ref.watch(profileProvider).profile;

                  return ProfileCard(
                    name: state.username,
                    text: state.bio,
                    icon: state.icon,
                    online: true,
                    size: Sizes.mediumMinus,
                  );
                },
              ),
            ),

            //Settings Icon
            Padding(
              padding: const EdgeInsets.only(right: Pad.medium),
              child: Transform.rotate(
                angle: -90 * (pi / 180),
                child: Container(
                  width: Sizes.smallPlus,
                  height: Sizes.smallPlus,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.small)),
                    color: Cols.grey107,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.sliders,
                    size: Sizes.small,
                    color: Cols.grey29,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
