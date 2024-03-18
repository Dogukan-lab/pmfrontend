import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/images/custom_icon_button.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key, required this.user, this.isLast = false});

  final Profile user;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Pad.small),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Pad.small),
            child: Row(
              children: [
                Expanded(
                  child: HoverWidget(
                    builder: (isHovering) => Consumer(
                      builder: (_, ref, child) => GestureDetector(
                        onTap: () => ref.read(chatListProvider.notifier).selectChat(user, ref),
                        child: child,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isHovering ? Cols.grey38 : Colors.transparent,
                          borderRadius: BorderRadius.circular(Pad.mediumPlus),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileCard(
                              name: user.username,
                              text: user.status,
                              icon: user.icon,
                              online: user.online,
                            ),
                            CustomIconButton(
                              FontAwesomeIcons.message,
                              iconSize: Pad.mediumPlus,
                              background: isHovering ? Cols.grey107 : Cols.grey75,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: Pad.medium),
                Consumer(
                  builder: (_, ref, __) {
                    final isFriend = ref.read(profileProvider).friends.indexWhere(
                              (other) => other.username == user.username,
                            ) !=
                        -1;
                    final profile = ref.read(profileProvider.notifier);

                    return HoverWidget(
                      builder: (isHovering) => GestureDetector(
                        onTap: () => isFriend ? profile.removeFriend(user) : profile.addFriend(user),
                        child: CustomIconButton(
                          isFriend ? FontAwesomeIcons.minus : FontAwesomeIcons.plus,
                          iconSize: Pad.mediumPlus,
                          background: isHovering ? Cols.grey107 : Cols.grey75,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (!isLast) const Divider(color: Cols.grey107),
        ],
      ),
    );
  }
}
