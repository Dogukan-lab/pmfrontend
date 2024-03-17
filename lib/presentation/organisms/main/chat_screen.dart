import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat_list_state.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatListProvider);

    return Expanded(
      flex: 5,
      child: Column(
        children: [
          HomePageHeader(state.selected!, Cols.grey38),
          Expanded(
            child: Container(
              color: Cols.grey33,
            ),
          ),
        ],
      ),
    );
  }
}
