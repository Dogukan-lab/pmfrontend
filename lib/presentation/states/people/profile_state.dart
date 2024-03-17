import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class ProfileState {
  ProfileState({
    required this.profile,
    required this.background,
    required this.friends,
  });

  final Profile profile;
  final int background;
  final List<Profile> friends;

  ProfileState copyWith({
    Profile? profile,
    int? background,
    List<Profile>? friends,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      background: background ?? this.background,
      friends: friends ?? this.friends,
    );
  }

  factory ProfileState.fromJson(Map<String, dynamic> json) {
    return ProfileState(
      profile: Profile.fromJson(json['user']),
      background: json['user']['background'] as int,
      friends: (json['user']['friends'] as List<dynamic>).map((friendJson) => Profile.fromJson(friendJson)).toList(),
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(ProfileState(
          profile: const Profile.empty('...'),
          background: 0,
          friends: [],
        ));

  void loadProfile(ProfileState profile) {
    state = profile;
  }

  void addFriend(Profile friend) => state = state.copyWith(friends: state.friends + [friend]);

  void removeFriend(Profile friend) => state = state.copyWith(
        friends: state.friends.where((user) => user.username != friend.username).toList(),
      );
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) => ProfileNotifier());
