import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/usecases/hub_connection_usecase.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void sendMessageUsecase(WidgetRef ref, String message, String targetUsername) async {
  Message msg = Message(message, DateTime.now().toLocal(), true);
  ref.read(chatProvider.notifier).addMessage(msg);

  await apiPost(
    'Chat/SendMessage',
    query: 'targetUsername=$targetUsername',
    params: jsonEncode(
      msg.toJson(ref.read(profileProvider).profile.username),
    ),
  );

  //Ping Hub
  pingHubUser(targetUsername);
}

void deleteMessageUsecase(WidgetRef ref, int index) async {
  ref.read(chatProvider.notifier).removeMessage(index);

  //Ping Hub
}
