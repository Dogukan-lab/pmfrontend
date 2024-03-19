import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: Sizes.mediumMinus,
        ),
        Text(
          message.data,
          style: Styles.gg.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
