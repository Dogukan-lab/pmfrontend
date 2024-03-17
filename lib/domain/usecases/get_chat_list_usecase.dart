import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat_list_state.dart';

void getChatList(WidgetRef ref) async {
  // await Future.delayed(const Duration(seconds: 1));

  final now = DateTime.now();

  ref.read(chatListProvider.notifier).loadChats([
    ChatListEntry(const Profile('Heirloomless', '', 5, false), 'chatlog 1', now),
    ChatListEntry(const Profile('LarsingDash', '', 4, true), 'chatlog 2', now),
    ChatListEntry(const Profile('Owon', '', 0, false), 'chatlog 3', now),
    ChatListEntry(const Profile('Owon1', '.', 0, false), 'chatlog 4', now),
    ChatListEntry(const Profile('Owon2', '..', 0, false), 'chatlog 5', now),
    ChatListEntry(const Profile('Owon3', '...', 0, false), 'chatlog 6', now),
    ChatListEntry(const Profile('Owon4', '....', 0, false), 'chatlog 7', now),
    ChatListEntry(const Profile('Owon5', '.....', 0, false), 'chatlog 8', now),
    ChatListEntry(const Profile('Owon6', '......', 0, false), 'chatlog 9', now),
  ]);
}
