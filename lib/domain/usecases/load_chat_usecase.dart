import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat_state.dart';

void loadChat(WidgetRef ref, Profile profile) async {
  final chat = ref.read(chatProvider.notifier);
  chat.loadChat(ChatState(profile, []));
}
