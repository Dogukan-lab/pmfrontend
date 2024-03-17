import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class OnlineUsersState extends StateNotifier<List<Profile>> {
  OnlineUsersState() : super([]);

  void addUsers(List<Profile> users) => state = state + users;
}

final onlineUsersProvider = StateNotifierProvider<OnlineUsersState, List<Profile>>(
  (ref) => OnlineUsersState(),
);
