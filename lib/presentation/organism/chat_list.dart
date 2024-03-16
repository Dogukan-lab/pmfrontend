import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomePageHeader('Chats', Cols.grey29),
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
