import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader(this.data, this.col, {super.key});

  final String data;
  final Color col;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.smallPlus,
      alignment: Alignment.centerLeft,
      color: col,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Pad.medium),
        child: Text(
          data,
          style: Styles.header,
        ),
      ),
    );
  }
}
