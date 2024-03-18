import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/organisms/settings/settings_textfields.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            final notifier = ref.read(settingsVisibleState.notifier);
            notifier.state = !notifier.state;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.largeMinus, vertical: Sizes.medium),
          child: Container(
            color: Cols.grey38,
            child: const Column(
              children: [
                //Header
                HomePageHeader('Settings', Cols.grey29),

                //List
                SettingsTextfields(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
