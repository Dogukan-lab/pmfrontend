import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

void loadChat(WidgetRef ref, Profile profile) async {
  final chat = ref.read(chatProvider.notifier);
  final chatState = ref.read(chatListProvider);

  final id = chatState.chats.firstWhere((element) => chatState.selected == element.profile).chatId;

  final response = await apiGet('Chat/Chat', query: 'id=$id');

  if (response != null && response.statusCode == HttpStatus.ok) {
    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    List<Message> messages = (jsonMap['messages'] as List<dynamic>).map((message) => Message.fromJson(message, profile.username)).toList();
    chat.loadChat(ChatState(profile, messages));
  }

  // print()
//Get list of messages from the current chat
  // final List<Message> messages = chatState.chats.;
  // print("MESSAGES MEN");
  // for (var elemtn in chatState.messages) {
  // print(elemtn.data);
  // }
}

String formatDateTime(DateTime time, bool onlyTime) {
  String result = '${time.hour}: ${time.minute}';
  if (!onlyTime) result = '${time.day}/${time.month}/${time.year} $result';
  return result;
}
