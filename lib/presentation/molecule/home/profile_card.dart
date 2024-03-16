import 'package:flutter/material.dart';
import 'package:pmfrontend/data/repositories/icon_repository.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.icon,
    required this.name,
    required this.text,
    // required this.online,
  });

  final int icon;
  final String name;
  final String text;
  // final bool online;

  @override
  Widget build(BuildContext context) {
    const double height = Sizes.small;

    return Row(
      children: [
        Image.asset(
          iconRepository.getIcon(icon % amountOfIcons),
          width: height,
          height: height,
        ),
        Padding(
          padding: const EdgeInsets.only(left: Pad.small),
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.gg.copyWith(fontSize: 20),
                ),
                Text(
                  text,
                  style: Styles.gg.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
