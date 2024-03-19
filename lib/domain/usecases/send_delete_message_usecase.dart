import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

void sendMessageUsecase(WidgetRef ref, String message) async {
  ref.read(chatProvider.notifier).addMessage(Message(message, DateTime.now(), true));
}

void deleteMessageUsecase(WidgetRef ref, int index) async {
  ref.read(chatProvider.notifier).removeMessage(index);
}
