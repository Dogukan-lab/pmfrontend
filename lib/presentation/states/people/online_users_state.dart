import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class SearchedUsersState extends StateNotifier<List<Profile>> {
  SearchedUsersState() : super([]);

  void addUsers(List<Profile> users) => state = state + users;
}

final searchedUsersProvider = StateNotifierProvider<SearchedUsersState, List<Profile>>(
  (ref) => SearchedUsersState(),
);
