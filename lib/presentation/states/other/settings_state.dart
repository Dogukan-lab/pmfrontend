import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class Settings {
  Settings({required this.username, required this.status, required this.icon, required this.background});

  final String username;
  final String status;
  final int icon;
  final int background;

  Settings copyWith({
    String? username,
    String? status,
    int? icon,
    int? background,
  }) {
    return Settings(
      username: username ?? this.username,
      status: status ?? this.status,
      icon: icon ?? this.icon,
      background: background ?? this.background,
    );
  }
}

class SettingsState {
  SettingsState(this.current, this.next);

  final Settings current;
  final Settings next;

  SettingsState copyWith({Settings? current, Settings? next}) => SettingsState(current ?? this.current, next ?? this.next);
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier(Settings init) : super(SettingsState(init, init));

  void updateNext(Settings next) => state = state.copyWith(next: next);
  void swap() => state = state.copyWith(current: state.next);
}

final settingsState = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  final state = ref.read(profileProvider);
  return SettingsNotifier(Settings(
    username: state.profile.username,
    status: state.profile.status,
    icon: state.profile.icon,
    background: state.background,
  ));
});
final settingsVisibleState = StateProvider<bool>((ref) => false);
