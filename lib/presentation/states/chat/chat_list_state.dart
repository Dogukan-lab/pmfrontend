import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/domain/usecases/load_chat_usecase.dart';

class ChatListEntry {
  ChatListEntry(
    this.chatId,
    this.profile,
    this.lastMessage,
    this.lastRead,
  );

  final int chatId;
  final Profile profile;
  final String lastMessage;
  final DateTime lastRead;

  factory ChatListEntry.fromJson(Map<String, dynamic> json, String ownUsername) {
    final List<dynamic> users = json['users'];
    Profile user = users.map((user) => Profile.fromJson(user)).toList().firstWhere(
          (user) => user.username != ownUsername,
        );

    return ChatListEntry(
      json['chatId'] as int,
      user,
      'Last Message',
      DateTime.now(),
    );
  }
}

class ChatListState {
  ChatListState(this.chats, this.selected);

  final List<ChatListEntry> chats;
  final Profile? selected;
}

class ChatListNotifier extends StateNotifier<ChatListState> {
  ChatListNotifier() : super(ChatListState([], null));

  void loadChats(List<ChatListEntry> chats) => state = ChatListState(chats, state.selected);
  void selectChat(Profile? profile, WidgetRef ref) {
    state = ChatListState(state.chats, profile);
    if (profile != null) loadChat(ref, profile);
  }
}

final chatListProvider = StateNotifierProvider<ChatListNotifier, ChatListState>(
  (ref) => ChatListNotifier(),
);
