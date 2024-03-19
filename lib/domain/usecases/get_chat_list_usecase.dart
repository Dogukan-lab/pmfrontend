import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';

void getChatList(WidgetRef ref) async {
  await Future.delayed(const Duration(milliseconds: 500));

  final chats = [
    ChatListEntry(const Profile(username: 'Owon4', status: 'Owon status', bio: 'Owon bio', icon: 6, online: false), 'lastMessage 6',
        DateTime.now().add(const Duration(seconds: 6))),
    ChatListEntry(const Profile(username: 'Owon3', status: 'Owon status', bio: 'Owon bio', icon: 5, online: false), 'lastMessage 5',
        DateTime.now().add(const Duration(seconds: 5))),
    ChatListEntry(const Profile(username: 'Owon5', status: 'Owon status', bio: 'Owon bio', icon: 7, online: false), 'lastMessage 7',
        DateTime.now().add(const Duration(seconds: 7))),
    ChatListEntry(const Profile(username: 'LarsingDash', status: 'LarsingDash statsu', bio: 'LarsingDash bio', icon: 1, online: true),
        'lastMessage 1', DateTime.now().add(const Duration(seconds: 1))),
    ChatListEntry(const Profile(username: 'Owon6', status: 'Owon status', bio: 'Owon bio', icon: 8, online: false), 'lastMessage 8',
        DateTime.now().add(const Duration(seconds: 8))),
    ChatListEntry(const Profile(username: 'Owon', status: 'Owon status', bio: 'Owon bio', icon: 2, online: false), 'lastMessage 2',
        DateTime.now().add(const Duration(seconds: 2))),
    ChatListEntry(const Profile(username: 'Owon7', status: 'Owon status', bio: 'Owon bio', icon: 9, online: false), 'lastMessage 9',
        DateTime.now().add(const Duration(seconds: 9))),
    ChatListEntry(const Profile(username: 'Heirloomless', status: 'Heirloomless status', bio: 'Heirloomless bio', icon: 0, online: false),
        'lastMessage 0', DateTime.now().add(const Duration(seconds: 0))),
    ChatListEntry(const Profile(username: 'Owon2', status: 'Owon status', bio: 'Owon bio', icon: 4, online: false), 'lastMessage 4',
        DateTime.now().add(const Duration(seconds: 4))),
    ChatListEntry(const Profile(username: 'Owon1', status: 'Owon status', bio: 'Owon bio', icon: 3, online: false), 'lastMessage 3',
        DateTime.now().add(const Duration(seconds: 3))),
  ];

  chats.sort((a, b) => a.lastRead.compareTo(b.lastRead));

  ref.read(chatListProvider.notifier).loadChats(chats);
}
