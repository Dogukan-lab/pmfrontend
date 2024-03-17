import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomePageHeader('Username', Cols.grey38),
        Expanded(
          child: Container(
            color: Cols.grey33,
          ),
        ),
      ],
    );
  }
}
