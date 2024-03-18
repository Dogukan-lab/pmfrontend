import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class HallownestHeader extends StatelessWidget {
  const HallownestHeader(this.text, {super.key, this.size = 20, this.center = false});

  final String text;
  final double size;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: Styles.gg.copyWith(fontSize: size),
        textAlign: center ? TextAlign.center : TextAlign.start,
      ),
    );
  }
}
