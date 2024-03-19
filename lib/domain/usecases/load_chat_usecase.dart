import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

void loadChat(WidgetRef ref, Profile profile) async {
  final chat = ref.read(chatProvider.notifier);
  final now = DateTime.now();

  final messages = [
    Message('Message 4', now.subtract(const Duration(seconds: 4)), true),
    Message('Message 1', now.subtract(const Duration(seconds: 1)), true),
    Message('Message 0', now.subtract(const Duration(seconds: 0)), true),
    Message('Message 3', now.subtract(const Duration(seconds: 3)), false),
    Message('Message 6', now.subtract(const Duration(seconds: 6)), true),
    Message('Message 2', now.subtract(const Duration(seconds: 2)), false),
    Message('Message 5', now.subtract(const Duration(seconds: 5)), false),
  ];

  messages.sort((a, b) => b.time.compareTo(a.time));

  chat.loadChat(ChatState(profile, messages));
}
