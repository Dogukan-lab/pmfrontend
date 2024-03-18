import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

final settingsState = StateProvider<Profile>((ref) => ref.read(profileProvider).profile);
final settingsVisibleState = StateProvider<bool>((ref) => false);
