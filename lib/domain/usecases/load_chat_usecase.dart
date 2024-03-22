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

  final id = chatState.chats.firstWhere((element) => chatState.selected!.username == element.profile.username).chatId;

  final response = await apiGet('Chat/Chat', query: 'id=$id');

  if (response != null && response.statusCode == HttpStatus.ok) {
    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    List<Message> messages = (jsonMap['messages'] as List<dynamic>).map((message) => Message.fromJson(message, profile.username)).toList();
    chat.loadChat(ChatState(profile, messages));
  }
}

String formatDateTime(DateTime time, bool onlyTime) {
  String result = '${lead(time.hour)}: ${lead(time.minute)}';
  if (!onlyTime) result = '${lead(time.day)}/${lead(time.month)}/${lead(time.year)} $result';
  return result;
}

String lead(int text) => text.toString().padLeft(2, '0');
