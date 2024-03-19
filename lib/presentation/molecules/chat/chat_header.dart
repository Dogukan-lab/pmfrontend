import 'package:flutter/material.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/images/profile_picture.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader(this.profile, this.message, {super.key, this.isFirst = false});

  final Profile profile;
  final Message message;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFirst ? const EdgeInsets.only() : const EdgeInsets.only(top: Pad.medium),
      child: Row(
        children: [
          SizedBox(
            width: Sizes.mediumMinus,
            child: ProfilePicture(profile.icon, Sizes.small, Pad.small),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.username,
                style: Styles.ggHeader,
              ),
              Text(
                message.data,
                style: Styles.gg.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
