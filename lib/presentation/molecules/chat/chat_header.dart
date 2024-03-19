import 'package:flutter/material.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/images/profile_picture.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/molecules/chat/chat_message.dart';
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
      padding: EdgeInsets.only(top: isFirst ? Pad.smallPlus : Pad.medium),
      child: HoverWidget(
        builder: (isHovering) => Container(
          color: isHovering ? Cols.grey33 : Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: Sizes.mediumMinus,
                child: ProfilePicture(profile.icon, Sizes.small, Pad.small),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profile.username,
                        style: Styles.ggHeader,
                      ),
                      const SizedBox(width: Pad.small),
                      Text(
                        '${message.time.day}/${message.time.month}/${message.time.year} ${message.time.hour}: ${message.time.minute}',
                        style: Styles.ggGrey,
                      ),
                    ],
                  ),
                  ChatMessage(message, withPadding: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
