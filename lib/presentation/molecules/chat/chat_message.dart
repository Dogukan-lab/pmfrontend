import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
    this.message, {
    super.key,
    this.withPadding = true,
  });

  final Message message;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (isHovering) => Container(
        color: isHovering ? Cols.grey33 : Colors.transparent,
        child: Row(
          children: [
            if (withPadding)
              Container(
                width: Sizes.mediumMinus,
                alignment: Alignment.center,
                child: isHovering ? Text('${message.time.hour}: ${message.time.minute}', style: Styles.ggGrey) : null,
              ),
            Text(
              message.data,
              style: Styles.gg.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
