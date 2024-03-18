import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/images/custom_icon_button.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OwnProfileCard extends StatelessWidget {
  const OwnProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return GestureDetector(
          onTap: () {
            final notifier = ref.read(settingsVisibleState.notifier);
            notifier.state = !notifier.state;
          },
          child: child!,
        );
      },
      child: HoverWidget(
        builder: (isHovering) => Container(
          height: Sizes.medium,
          color: isHovering ? Cols.grey33 : Cols.grey29,
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
                      text: state.status,
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
                child: CustomIconButton(
                  FontAwesomeIcons.sliders,
                  angle: -90,
                  background: isHovering ? Cols.grey107 : Cols.grey75,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
