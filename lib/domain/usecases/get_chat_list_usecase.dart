import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/people/online_users_state.dart';

void getChatList(WidgetRef ref) async {
  await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

  final now = DateTime.now();
  final List<ChatListEntry> list = [];
  final online = ref.read(searchedUsersProvider);

  for (int i = 0; i < online.length; i++) {
    list.add(ChatListEntry(online[i], 'lastMessage $i', now));
  }

  ref.read(chatListProvider.notifier).loadChats(list);
}
