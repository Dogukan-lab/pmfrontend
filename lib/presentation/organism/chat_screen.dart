import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.smallPlus,
          color: Cols.grey54,
        ),
        Expanded(
          child: Container(
            color: Cols.grey64,
          ),
        ),
      ],
    );
  }
}
