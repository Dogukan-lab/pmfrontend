import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/load_chat_usecase.dart';
import 'package:pmfrontend/domain/usecases/send_delete_message_usecase.dart';
import 'package:pmfrontend/presentation/atoms/tools/hover_widget.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
    this.index,
    this.message, {
    super.key,
    this.withPadding = true,
  });

  final int index;
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
                child: isHovering ? Text(formatDateTime(message.time, true), style: Styles.ggGrey) : null,
              ),
            Text(
              message.data,
              style: Styles.gg.copyWith(fontWeight: FontWeight.w400),
            ),
            if (withPadding && isHovering) ...removeButton(index),
          ],
        ),
      ),
    );
  }
}

List<Widget> removeButton(int index) => [const SizedBox.shrink()]; 
// [
//       const Spacer(),
//       Padding(
//         padding: const EdgeInsets.only(right: Pad.small),
//         child: Consumer(
//           builder: (_, ref, child) => GestureDetector(
//             onTap: () => deleteMessageUsecase(ref, index),
//             child: child,
//           ),
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Cols.grey48,
//               borderRadius: BorderRadius.all(Radius.circular(Radii.small)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: Pad.smallMinus),
//               child: Text(
//                 'Remove',
//                 style: Styles.ggGrey,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ];
