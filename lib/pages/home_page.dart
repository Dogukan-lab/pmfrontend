import 'package:flutter/widgets.dart';
import 'package:pmfrontend/pale_themes.dart';
import 'package:pmfrontend/widgets/home/chat_list.dart';
import 'package:pmfrontend/widgets/home/friends_list.dart';
import 'package:pmfrontend/widgets/home/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cols.grey22,
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: ChatList(),
          ),
          Expanded(
            flex: 5,
            child: HomeScreen(),
          ),
          Expanded(
            flex: 2,
            child: FriendsList(),
          ),
        ],
      ),
    );
  }
}
