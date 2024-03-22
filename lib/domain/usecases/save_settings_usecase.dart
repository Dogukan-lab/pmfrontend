import 'dart:io';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/usecases/hub_connection_usecase.dart';
import 'package:pmfrontend/main.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

void saveSettingsUsecase(WidgetRef ref) async {
  final settings = ref.read(settingsState);
  if (settings.current == settings.next) return;

  final profileNotifier = ref.read(profileProvider.notifier);
  final profile = ref.read(profileProvider);
  final settingsNotifier = ref.read(settingsState.notifier);

  profileNotifier.loadProfileState(
    profile.copyWith(
      profile: profile.profile.copyWith(
        username: settings.next.username,
        status: settings.next.status,
        bio: settings.next.bio,
        icon: settings.next.icon,
      ),
      background: settings.next.background,
    ),
  );

  settingsNotifier.swap();

  final response = await apiPost(
    'PmUser/UpdateUser',
    params: jsonEncode(settings.next.toJson()),
  );

  if (response != null && response.statusCode == HttpStatus.ok) {
    apiToken = response.body;
  }

  pingHubUser('*');
}
