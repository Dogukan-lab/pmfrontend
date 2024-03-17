import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

class ProfileState {
  ProfileState({
    required this.profile,
    required this.background,
  });

  final Profile profile;
  final int background;

  ProfileState copyWith({
    Profile? profile,
    int? background,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      background: background ?? this.background,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState(profile: const Profile.empty('...'), background: 0));

  void loadProfile(ProfileState profile) {
    state = profile;
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) => ProfileNotifier());
