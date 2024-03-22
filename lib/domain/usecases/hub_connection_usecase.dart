import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/hub_handler.dart';

void startHubConnection(WidgetRef ref) async {
  hubHandler.init(ref);
}

void pingHubUser(String username) async {
  await hubHandler.ping(username);
}
