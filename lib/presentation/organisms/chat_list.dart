import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/headers/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/molecules/profile/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';

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

                  if (state.chats.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: Pad.medium),
                      child: SizedBox(
                        width: Sizes.smallPlus,
                        height: Sizes.smallPlus,
                        child: CircularProgressIndicator(
                          color: Cols.grey75,
                          strokeWidth: 7.5,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      for (final chat in state.chats)
                        HoverWidget(
                          builder: (isHovering) {
                            final isSelected = state.selected != null && state.selected == chat.profile.id;

                            return Padding(
                              padding: const EdgeInsets.only(left: Pad.smallPlus, right: Pad.smallPlus, top: Pad.smallPlus),
                              child: GestureDetector(
                                onTap: chat.profile.icon == -1
                                    ? null
                                    : () {
                                        notifier.selectChat(isSelected ? null : chat.profile, ref);
                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
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
                            );
                          },
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
