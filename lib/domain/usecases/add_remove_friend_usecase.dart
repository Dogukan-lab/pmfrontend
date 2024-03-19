import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void addFriendUsecase(WidgetRef ref, Profile friend) async {
  final profile = ref.read(profileProvider.notifier);
  profile.addFriend(friend);
}

void removeFriendUsecase(WidgetRef ref, Profile friend) async {
  final profile = ref.read(profileProvider.notifier);
  profile.removeFriend(friend);
}
