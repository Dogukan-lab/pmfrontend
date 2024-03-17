// ignore_for_file: dead_code, prefer_const_declarations

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/presentation/molecules/home/own_profile_card.dart';
import 'package:pmfrontend/presentation/organisms/left/settings.dart';
import 'package:pmfrontend/presentation/organisms/main/chat_screen.dart';
import 'package:pmfrontend/presentation/organisms/main/profile_details.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/organisms/left/chat_list.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';

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
          Expanded(
            flex: 7,
            child: Consumer(
              builder: (_, ref, __) {
                final state = false; // Check if chat is selected DELETE DART IGNORES

                return state
                    ? const Row(
                        children: [
                          ChatScreen(),
                          ProfileDetails(),
                        ],
                      )
                    : const HomeScreen();
              },
            ),
          ),
        ],
      ),
    );
  }

  void startupProcedure(WidgetRef ref) async {
    getChatList(ref);
  }
}
