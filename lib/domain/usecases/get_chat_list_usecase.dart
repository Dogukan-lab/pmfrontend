import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';

void getChatList(WidgetRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));

  final now = DateTime.now();
  final List<ChatListEntry> list = [];
  final online = [
    const Profile(username: 'Heirloomless', status: 'Heirloomless status', icon: 5, online: false),
    const Profile(username: 'LarsingDash', status: 'LarsingDash statsu', icon: 4, online: true),
    const Profile(username: 'Owon', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon1', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon2', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon3', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon4', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon5', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon6', status: 'Owon status', icon: 0, online: false),
    const Profile(username: 'Owon7', status: 'Owon status', icon: 0, online: false),
  ];

  for (int i = 0; i < online.length; i++) {
    list.add(ChatListEntry(online[i], 'lastMessage $i', now));
  }

  ref.read(chatListProvider.notifier).loadChats(list);
}
