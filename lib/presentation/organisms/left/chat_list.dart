import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat_list_state.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Header
          const HomePageHeader('Chats', Cols.grey29),

          //List
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer(
                builder: (_, ref, __) {
                  var state = ref.watch(chatListState);

                  return Column(
                    children: [
                      for (final chat in state.entries)
                        Padding(
                          padding: const EdgeInsets.only(left: Pad.smallPlus, top: Pad.smallPlus),
                          child: ProfileCard(
                            name: chat.key.username,
                            text: chat.value,
                            icon: chat.key.icon,
                            online: chat.key.online,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
