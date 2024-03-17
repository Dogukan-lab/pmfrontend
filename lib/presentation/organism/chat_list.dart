import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/molecule/home/profile_card.dart';
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
            width: double.infinity,
            color: Cols.grey22,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  for (int i = 0; i < 30; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: Pad.smallPlus, top: Pad.smallPlus),
                      child: ProfileCard(name: 'Heirloomless', text: 'This is the bio', icon: i, online: i % 2 == 0),
                    ),
                ],
              ),
            ),
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
