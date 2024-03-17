import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/presentation/molecules/home/own_profile_card.dart';
import 'package:pmfrontend/presentation/organisms/settings.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/organisms/chat_list.dart';
import 'package:pmfrontend/presentation/organisms/friends_list.dart';
import 'package:pmfrontend/presentation/organisms/home_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('building home (check if this gets constantly called), remove when done debugging');
    startupProcedure(ref);

    return Container(
      color: Cols.grey22,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Consumer(
              builder: (_, ref, child) {
                final state = ref.watch(settingsState);

                return Column(
                  children: [
                    state ? const Settings() : const ChatList(),
                    child!,
                  ],
                );
              },
              child: const OwnProfileCard(),
            ),
          ),
          const Expanded(
            flex: 5,
            child: HomeScreen(),
          ),
          const Expanded(
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
