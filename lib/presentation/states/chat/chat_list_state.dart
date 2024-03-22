import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/domain/usecases/load_chat_usecase.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ChatListEntry {
  ChatListEntry(
    this.chatId,
    this.profile,
    this.lastMessage,
    this.lastRead,
  );

  final int chatId;
  final Profile profile; //Other user
  final String lastMessage; //Last message sent
  final DateTime lastRead;

  factory ChatListEntry.fromJson(Map<String, dynamic> json, String ownUsername) {
    final List<dynamic> users = json['users'];
    final List<Message> messages = (json['messages'] as List<dynamic>)
        .map(
          (element) => Message.fromJson(element, ownUsername),
        )
        .toList();

    Profile user = users.map((user) => Profile.fromJson(user)).toList().firstWhere(
          (user) => user.username != ownUsername,
        );

    messages.sort((a, b) => a.time.compareTo(b.time));

    return ChatListEntry(
      json['chatId'] as int,
      user,
      messages[messages.length - 1].data,
      messages[messages.length - 1].time,
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
