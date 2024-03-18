import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class SettingsTextfields extends ConsumerStatefulWidget {
  const SettingsTextfields({super.key});

  @override
  ConsumerState<SettingsTextfields> createState() => _SettingsTextfieldsState();
}

class _SettingsTextfieldsState extends ConsumerState<SettingsTextfields> {
  final _usernameController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void initState() {
    _usernameController.text = ref.read(profileProvider).profile.username;
    _statusController.text = ref.read(profileProvider).profile.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: Sizes.largePlus,
            height: Sizes.small,
            decoration: BoxDecoration(
              color: Cols.grey48,
              borderRadius: BorderRadius.circular(Radii.small),
            ),
            child: TextField(
              controller: _usernameController,
              onChanged: (value) => ref.read(profileProvider.notifier).updateUsername(value),
              style: Styles.gg,
              cursorColor: Cols.grey107,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: Styles.ggGrey,
                contentPadding: const EdgeInsets.symmetric(horizontal: Pad.small),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: Sizes.huge,
            height: Sizes.small,
            decoration: BoxDecoration(
              color: Cols.grey48,
              borderRadius: BorderRadius.circular(Radii.small),
            ),
            child: TextField(
              controller: _statusController,
              onChanged: (value) => ref.read(profileProvider.notifier).updateUsername(value),
              style: Styles.gg,
              cursorColor: Cols.grey107,
              decoration: InputDecoration(
                hintText: 'Status',
                hintStyle: Styles.ggGrey,
                contentPadding: const EdgeInsets.symmetric(horizontal: Pad.small),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
