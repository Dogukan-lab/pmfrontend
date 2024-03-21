import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/domain/usecases/hub_connection_usecase.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void addFriendUsecase(WidgetRef ref, Profile friend) async {
  final notifier = ref.read(profileProvider.notifier);
  notifier.addFriend(friend);

  await apiPost('PmUser/AddFriend', query: 'targetUser=${friend.username}');

  pingHubUser(friend.username);
}

void removeFriendUsecase(WidgetRef ref, Profile friend) async {
  final profile = ref.read(profileProvider.notifier);
  profile.removeFriend(friend);

  await apiPost('PmUser/RemoveFriend', query: 'targetUser=${friend.username}');

  pingHubUser(friend.username);
}
