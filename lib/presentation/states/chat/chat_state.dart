import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class Message {
  Message(this.data, this.time, this.isSender);

  final String data;
  final DateTime time;
  final bool isSender;

  factory Message.fromJson(Map<String, dynamic> json, String sender) => Message(
        json['data'] as String,
        DateTime.parse(json['timeStamp'] as String),
        json['userName'] != sender,
      );

  Map<String, dynamic> toJson(String username) => {
        'data': data,
        'timeStamp': time.toIso8601String(),
        'userName': username,
      };
}

class ChatState {
  ChatState(this.profile, this.messages);

  final Profile profile;
  final List<Message> messages;

  ChatState addMessage(Message message) => ChatState(profile, messages + [message]);
  ChatState removeMessage(int index) {
    final list = List<Message>.from(messages);
    list.removeAt(index);
    return ChatState(profile, list);
  }
}

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(const Profile.empty('...'), []));

  loadChat(ChatState chat) => state = chat;
  addMessage(Message message) => state = state.addMessage(message);
  removeMessage(int index) => state = state.removeMessage(index);
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) => ChatNotifier());
