import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
    this.data, {
    super.key,
    this.angle = 0,
    this.size = Sizes.smallPlus,
    this.iconSize = Sizes.small,
  });

  final IconData data;
  final double angle;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * (pi / 180),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Cols.grey48,
            width: 3,
          ),
          color: Cols.grey107,
        ),
        child: FaIcon(
          data,
          size: iconSize,
          color: Cols.grey29,
        ),
      ),
    );
  }
}
