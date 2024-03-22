import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

Future<void> getChatList(WidgetRef ref) async {
  final username = ref.read(profileProvider).profile.username;

  final response = await apiGet('Chat/UserChats');
  if (response != null && response.statusCode == HttpStatus.ok) {
    List<dynamic> rawList = jsonDecode(response.body);
    List<ChatListEntry> chats = rawList.map((chat) => ChatListEntry.fromJson(chat, username)).toList();

    chats.sort((a, b) => b.lastRead.compareTo(a.lastRead));

    ref.read(chatListProvider.notifier).loadChats(chats);
  }
}
