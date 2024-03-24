import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/usecases/get_chat_list_usecase.dart';
import 'package:pmfrontend/domain/usecases/load_chat_usecase.dart';
import 'package:pmfrontend/main.dart';
import 'package:pmfrontend/presentation/states/chat/chat_list_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';
import 'package:signalr_netcore/signalr_client.dart';

HubHandler hubHandler = HubHandler();

class HubHandler {
  HubHandler();

  late HubConnection _hub;

  void init(WidgetRef ref) async {
    var url = '${baseURL}chatHub';

    _hub = HubConnectionBuilder()
        .withUrl(
          url,
          options: HttpConnectionOptions(accessTokenFactory: () async => apiToken),
        )
        .build();
    _hub.onclose(({error}) => print('Connection Closed: ${error.toString()}'));
    _hub.onreconnecting(({error}) => print("onreconnecting called"));
    _hub.onreconnected(({connectionId}) => print("onreconnected called"));

    _hub.on('ReceivePing', (params) async {
      print('------------------');
      try {
        final username = ref.read(profileProvider).profile.username;

        print('$username received Ping from:');
        if (params != null) {
          final user = params[0];
          print('$user');

          if (user == username || (user == '*')) {
            final response = await apiGet('PmUser/GetUser', query: "username=$username");

            if (response != null && response.statusCode == HttpStatus.ok) {
              //Decode incomming json
              Map<String, dynamic> json = jsonDecode(response.body);
              final profileState = ProfileState.fromShallowJson(json);

              //Reload profile (for friends list)
              ref.read(profileProvider.notifier).loadProfileState(profileState);

              //Refresh chatList
              await getChatList(ref);

              //Refresh selected Chat
              final selected = ref.read(chatListProvider).selected;
              if (selected != null) {
                loadChat(
                  ref,
                  ref.read(chatListProvider).chats.firstWhere((chat) => chat.profile.id == selected).profile,
                );
              }

              print('Refreshed');
            } else {
              print(response?.statusCode ?? 'Response was null');
            }
          } else {
            print('Ignored');
          }
        }
      } catch (e) {
        print('WidgetRef outdated or something...');
      }
    });

    if (_hub.state != HubConnectionState.Connected) {
      await _hub.start()!.then((_) => print('Connected to hub'));
    }
  }

  Future<void> ping(String username) async {
    if (_hub.state == HubConnectionState.Connected) {
      try {
        await _hub.invoke('PingUser', args: [username]);
        print('Ping invoked successfully');
      } catch (e) {
        print('Error invoking ping: $e');
      }
    } else {
      print('SignalR connection is not in the Connected state');
    }
  }
}
