import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/presentation/organism/chat_screen.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/organism/chat_list.dart';
import 'package:pmfrontend/presentation/organism/friends_list.dart';
import 'package:pmfrontend/presentation/organism/home_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('building home (check if this gets constantly called), remove when done debugging');
    startupProcedure(ref);

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

  void startupProcedure(WidgetRef ref) async {
    getChatList(ref);
  }
}
