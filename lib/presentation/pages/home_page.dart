import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/presentation/molecules/profile/own_profile_card.dart';
import 'package:pmfrontend/presentation/pages/settings.dart';
import 'package:pmfrontend/presentation/organisms/main/chat_screen.dart';
import 'package:pmfrontend/presentation/organisms/main/profile_details.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/organisms/chat_list.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';

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
                    final isOnHomepage = ref.watch(chatListProvider).selected == null;

                    return isOnHomepage
                        ? const HomeScreen()
                        : const Row(
                            children: [
                              ChatScreen(),
                              ProfileDetails(),
                            ],
                          );
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
              final state = ref.watch(settingsVisibleState);
              return state ? const SettingsScreen() : const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }

  void startupProcedure(WidgetRef ref) async {
    await Future.delayed(Duration.zero);
    getChatList(ref);
  }
}
