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

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _controller = ScrollController();
  static bool first = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => jumpToBottom());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final profile = ref.watch(profileProvider).profile;

    //Jumping to bottom
    if (first) {
      first = false;
    } else {
      jumpToBottom();
    }

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
                  child: SingleChildScrollView(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
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
                          (state.messages[i].isSender != state.messages[i - 1].isSender) ||
                                  (state.messages[i].time.day != state.messages[i - 1].time.day)
                              ? ChatHeader(i, state.messages[i].isSender ? profile : state.profile, state.messages[i])
                              : ChatMessage(i, state.messages[i]),
                      ],
                    ),
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

  void jumpToBottom() async {
    await Future.delayed(Duration.zero);
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }
}
