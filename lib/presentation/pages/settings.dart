import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/usecases/save_settings_usecase.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/organisms/settings/settings_textfields.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            final settingsScreen = ref.read(settingsVisibleState.notifier);
            settingsScreen.state = !settingsScreen.state;

            saveSettingsUsecase(ref);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.largeMinus, vertical: Sizes.medium),
          child: Container(
            color: Cols.grey38,
            child: const Column(
              children: [
                HomePageHeader('Settings', Cols.grey29),
                SettingsTextfields(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
