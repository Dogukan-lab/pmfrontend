import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void addFriendUsecase(WidgetRef ref, Profile friend) async {
  final profile = ref.read(profileProvider.notifier);
  profile.addFriend(friend);

  apiPost('PmUser/AddFriend', query: 'targetUser=${friend.username}');
}

void removeFriendUsecase(WidgetRef ref, Profile friend) async {
  final profile = ref.read(profileProvider.notifier);
  profile.removeFriend(friend);

  apiPost('PmUser/RemoveFriend', query: 'targetUser=${friend.username}');
}
