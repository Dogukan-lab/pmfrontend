import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/hub_handler.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void startHubConnection(WidgetRef ref) async {
  var username = ref.read(profileProvider).profile.username;

  hubHandler.init(ref, username);
}

void pingHubUser(String username) async {
  await hubHandler.ping(username);
}
