import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class HallownestHeader extends StatelessWidget {
  const HallownestHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: Styles.gg.copyWith(fontSize: 20),
      ),
    );
  }
}
