import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/custom_icon_button.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, required this.user});

  final Profile user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Pad.smallPlus),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileCard(
                name: user.username,
                text: user.status,
                icon: user.icon,
                online: user.online,
              ),
              const Row(
                children: [
                  CustomIconButton(
                    FontAwesomeIcons.message,
                    iconSize: Pad.mediumPlus,
                  ),
                  SizedBox(width: Pad.medium),
                  CustomIconButton(
                    FontAwesomeIcons.ellipsisVertical,
                    iconSize: Pad.mediumPlus,
                  ),
                ],
              )
            ],
          ),
        ),
        const Divider(color: Cols.grey107),
      ],
    );
  }
}
