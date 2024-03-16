import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmfrontend/pale_themes.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.smallPlus,
          color: Cols.grey29,
        ),
        Expanded(
          child: Container(
            color: Cols.grey22,
          ),
        ),
        Container(
          height: Sizes.medium,
          color: Cols.grey29,
        ),
      ],
    );
  }
}
