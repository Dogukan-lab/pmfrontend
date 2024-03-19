import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class Message {
  Message(this.data, this.time, this.isSender);

  final String data;
  final DateTime time;
  final bool isSender;
}

class ChatState {
  ChatState(this.profile, this.messages);

  final Profile profile;
  final List<Message> messages;

  ChatState addMessage(Message message) => ChatState(profile, messages + [message]);
}

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(const Profile.empty('...'), []));

  loadChat(ChatState chat) => state = chat;
  addMessage(Message message) => state = state.addMessage(message);
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) => ChatNotifier());
