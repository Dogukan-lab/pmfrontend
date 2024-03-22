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

  ChatListEntry copyWith({
    int? chatId,
    Profile? profile,
    String? lastMessage,
    DateTime? lastRead,
  }) {
    return ChatListEntry(
      chatId ?? this.chatId,
      profile ?? this.profile,
      lastMessage ?? this.lastMessage,
      lastRead ?? this.lastRead,
    );
  }
}

class ChatListState {
  ChatListState(this.chats, this.selected);

  final List<ChatListEntry> chats;
  final int? selected;

  ChatListState copyWith({
    List<ChatListEntry>? chats,
    int? selected,
  }) {
    return ChatListState(
      chats ?? this.chats,
      selected ?? this.selected,
    );
  }
}

class ChatListNotifier extends StateNotifier<ChatListState> {
  ChatListNotifier() : super(ChatListState([], null));

  void loadChats(List<ChatListEntry> chats) => state = ChatListState(chats, state.selected);

  void selectChat(Profile? profile, WidgetRef ref) {
    state = ChatListState(state.chats, profile?.id);
    if (profile != null) loadChat(ref, profile);
  }

  void updateChat(String username, Message message) {
    final newList = List<ChatListEntry>.from(state.chats);
    final chat = newList.firstWhere((chat) => chat.profile.username == username);

    newList.remove(chat);
    final newChat = chat.copyWith(lastMessage: message.data, lastRead: message.time);
    newList.add(newChat);

    newList.sort((a, b) => b.lastRead.compareTo(a.lastRead));

    state = state.copyWith(chats: newList);
  }
}

final chatListProvider = StateNotifierProvider<ChatListNotifier, ChatListState>(
  (ref) => ChatListNotifier(),
);
