// ignore_for_file: dead_code, prefer_const_declarations

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/domain/usecases/get_online_users_usecase.dart';
import 'package:pmfrontend/presentation/molecules/home/own_profile_card.dart';
import 'package:pmfrontend/presentation/organisms/left/settings.dart';
import 'package:pmfrontend/presentation/organisms/main/chat_screen.dart';
import 'package:pmfrontend/presentation/organisms/main/profile_details.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/organisms/left/chat_list.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';
import 'package:pmfrontend/presentation/states/profile_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    startupProcedure(ref);

    return Stack(
      children: [
        //Content
        Container(
          color: Cols.grey22,
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ChatList(),
                    OwnProfileCard(),
                  ],
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
        ),

        //Settings
        Container(
          color: Cols.grey22.withAlpha(225),
          child: Consumer(
            builder: (_, ref, child) {
              final state = ref.watch(settingsState);
              return state ? const Settings() : const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }

  void startupProcedure(WidgetRef ref) async {
    await Future.delayed(Duration.zero);
    getChatList(ref);
    getOnlineUsers(ref);
    ref.read(profileProvider.notifier).addFriend(const Profile('Heirloomless', 'Heirloomless status', 5, true));
  }
}
