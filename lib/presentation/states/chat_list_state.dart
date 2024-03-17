import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class ChatListEntry {
  ChatListEntry(
    this.profile,
    this.lastMessage,
    this.lastRead,
  );

  final Profile profile;
  final String lastMessage;
  final DateTime lastRead;
}

class ChatListState {
  ChatListState(this.chats, this.selected);

  final List<ChatListEntry> chats;
  final String? selected;
}

class ChatListNotifier extends StateNotifier<ChatListState> {
  ChatListNotifier() : super(_initialState());

  static ChatListState _initialState() {
    final now = DateTime.now();

    return ChatListState(
      [
        ChatListEntry(const Profile.empty('.'), '.', now),
        ChatListEntry(const Profile.empty('.'), '..', now),
        ChatListEntry(const Profile.empty('.'), '...', now),
      ],
      null,
    );
  }

  void selectChat(String? username) {
    state = ChatListState(state.chats, username);
    print("selected: ${state.selected}");
  }
}

final chatListProvider = StateNotifierProvider<ChatListNotifier, ChatListState>(
  (ref) => ChatListNotifier(),
);
