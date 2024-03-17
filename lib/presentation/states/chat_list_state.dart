import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';

final chatListState = StateProvider<Map<Profile, String>>(
  (ref) => Map.of(
    {
      const Profile.empty('.'): '...',
      const Profile.empty('..'): '...',
      const Profile.empty('...'): '...',
    },
  ),
);
