import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/background_repository.dart';
import 'package:pmfrontend/data/repositories/icon_repository.dart';
import 'package:pmfrontend/domain/usecases/save_settings_usecase.dart';
import 'package:pmfrontend/presentation/atoms/headers/home_page_header.dart';
import 'package:pmfrontend/presentation/organisms/settings/carousel_selector.dart';
import 'package:pmfrontend/presentation/organisms/settings/settings_textfields.dart';
import 'package:pmfrontend/presentation/atoms/images/profile_picture.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: Sizes.largePlus, vertical: Sizes.medium),
          child: Container(
            color: Cols.grey38,
            child: Column(
              children: [
                //Header
                const HomePageHeader('Settings', Cols.grey29),
                //Username/Status
                const SettingsTextfields(),
                //Icons
                CarouselSelector(
                  amount: amountOfIcons,
                  fraction: 1 / 5.5,
                  initial: (ref) => ref.read(settingsState).current.icon,
                  onChange: (state, notifier, index) => notifier.updateNext(state.next.copyWith(icon: index)),
                  child: (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Pad.smallPlus),
                    child: ProfilePicture(index, Sizes.largeMinus),
                  ),
                ),
                //Padding
                const SizedBox(height: Pad.large),
                //Background
                CarouselSelector(
                  amount: amountOfBackgrounds,
                  fraction: 1 / 4,
                  initial: (ref) => ref.read(settingsState).current.background,
                  onChange: (state, notifier, index) => notifier.updateNext(state.next.copyWith(background: index)),
                  child: (index) => Image.asset(
                    backgroundRepository.getBackground(index),
                    width: Sizes.largeMinus,
                    height: Sizes.largeMinus,
                  ),
                ),
                //Padding
                const SizedBox(height: Pad.large),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
