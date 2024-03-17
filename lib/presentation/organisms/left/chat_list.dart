import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/hover_widget.dart';
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
                  var state = ref.watch(chatListProvider);
                  var notifier = ref.read(chatListProvider.notifier);

                  return Column(
                    children: [
                      for (final chat in state.chats)
                        HoverWidget(
                          builder: (isHovering) => Padding(
                            padding: const EdgeInsets.only(left: Pad.smallPlus, right: Pad.smallPlus, top: Pad.smallPlus),
                            child: GestureDetector(
                              onTap: chat.profile.icon == -1
                                  ? null
                                  : () {
                                      final tapped = chat.profile;
                                      notifier.selectChat(state.selected == tapped ? null : tapped, ref);
                                    },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: state.selected == chat.profile.username
                                      ? Cols.grey33
                                      : isHovering
                                          ? Cols.grey29
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(Sizes.smallPlus),
                                ),
                                child: ProfileCard(
                                  name: chat.profile.username,
                                  text: chat.lastMessage,
                                  icon: chat.profile.icon,
                                  online: chat.profile.online,
                                ),
                              ),
                            ),
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
