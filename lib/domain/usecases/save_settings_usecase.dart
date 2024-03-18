import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void saveSettingsUsecase(WidgetRef ref) async {
  final profileNotifier = ref.read(profileProvider.notifier);
  final profile = ref.read(profileProvider);
  final settingsNotifier = ref.read(settingsState.notifier);
  final settings = ref.read(settingsState);

  profileNotifier.loadProfileState(
    profile.copyWith(
      profile: profile.profile.copyWith(
        username: settings.next.username,
        status: settings.next.status,
        icon: settings.next.icon,
      ),
      background: settings.next.background,
    ),
  );

  settingsNotifier.swap();

  //API call
}
