import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/tools/custom_textfield.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class SettingsTextfields extends ConsumerStatefulWidget {
  const SettingsTextfields({super.key});

  @override
  ConsumerState<SettingsTextfields> createState() => _SettingsTextfieldsState();
}

class _SettingsTextfieldsState extends ConsumerState<SettingsTextfields> {
  // final _usernameController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void initState() {
    // _usernameController.text = ref.read(profileProvider).profile.username;
    _statusController.text = ref.read(profileProvider).profile.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
            width: Sizes.largePlus,
            height: Sizes.small,
            backgroundColor: Cols.grey48,
            style: Styles.gg,
            init: (controller) => controller.text = ref.read(profileProvider).profile.username,
            hint: 'Username',
            hintStyle: Styles.ggGrey,
            onChanged: (value) {
              final state = ref.read(settingsState);
              final notifier = ref.read(settingsState.notifier);
              notifier.updateNext(state.next.copyWith(username: value));
            },
          ),
          CustomTextField(
            width: Sizes.huge,
            height: Sizes.small,
            backgroundColor: Cols.grey48,
            style: Styles.gg,
            init: (controller) => controller.text = ref.read(profileProvider).profile.username,
            hint: 'Status',
            hintStyle: Styles.ggGrey,
            onChanged: (value) {
              final state = ref.read(settingsState);
              final notifier = ref.read(settingsState.notifier);
              notifier.updateNext(state.next.copyWith(status: value));
            },
          ),
        ],
      ),
    );
  }
}
