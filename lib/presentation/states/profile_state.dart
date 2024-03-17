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
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) => ProfileNotifier());
