import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/send_delete_message_usecase.dart';
import 'package:pmfrontend/presentation/atoms/images/background_screen.dart';
import 'package:pmfrontend/presentation/atoms/headers/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/tools/custom_textfield.dart';
import 'package:pmfrontend/presentation/molecules/chat/chat_header.dart';
import 'package:pmfrontend/presentation/molecules/chat/chat_message.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);
    final profile = ref.watch(profileProvider).profile;

    return Expanded(
      flex: 5,
      child: Container(
        color: Cols.grey29,
        child: Column(
          children: [
            HomePageHeader(state.profile.username, Cols.grey38),
            Expanded(
              child: BackgroundScreen(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      if (state.messages.isNotEmpty)
                        ChatHeader(
                          0,
                          state.messages[0].isSender ? profile : state.profile,
                          state.messages[0],
                          isFirst: true,
                        ),
                      for (int i = 1; i < state.messages.length; i++)
                        state.messages[i].isSender != state.messages[i - 1].isSender
                            ? ChatHeader(i, state.messages[i].isSender ? profile : state.profile, state.messages[i])
                            : ChatMessage(i, state.messages[i]),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Pad.small),
              child: CustomTextField(
                height: Sizes.small,
                backgroundColor: Cols.grey48,
                style: Styles.gg,
                hint: 'Message ${state.profile.username}',
                hintStyle: Styles.ggGrey,
                clearOnSubmit: true,
                requestFocus: true,
                init: (controller) {},
                onChanged: (controller) {},
                onSubmitted: (value) => sendMessageUsecase(ref, value, state.profile.username),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
