import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/images/profile_picture.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.text,
    required this.icon,
    required this.online,
    this.size = Sizes.smallPlus,
    this.outlineSize = Pad.small,
  });

  final int icon;
  final String name;
  final String text;
  final bool online;
  final double size;
  final double outlineSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ProfilePicture(icon, size, outlineSize),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Cols.grey48,
                  width: 3,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
                borderRadius: BorderRadius.circular(size),
                backgroundBlendMode: BlendMode.src,
                color: online ? Cols.green : Cols.grey107,
              ),
              width: Pad.smallPlus,
              height: Pad.smallPlus,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: Pad.small),
          child: SizedBox(
            height: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
