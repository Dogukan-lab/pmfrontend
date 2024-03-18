import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/icon_repository.dart';
import 'package:pmfrontend/presentation/atoms/profile_picture.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';

class IconSelector extends StatefulWidget {
  const IconSelector({super.key});

  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (_, ref, __) {
          final initial = ref.read(settingsState).current.icon;

          return CarouselSlider.builder(
            itemCount: amountOfIcons,
            carouselController: _controller,
            itemBuilder: (_, index, __) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: Pad.mediumMinus),
              child: SizedBox(
                width: double.infinity,
                child: ProfilePicture(index, Sizes.largeMinus),
              ),
            ),
            options: CarouselOptions(
              viewportFraction: 1 / 4,
              height: Sizes.large,
              onPageChanged: (index, _) {
                final state = ref.read(settingsState);
                final notifier = ref.read(settingsState.notifier);
                notifier.updateNext(state.next.copyWith(icon: index));
              },
              initialPage: initial == -1 ? 0 : initial,
            ),
          );
        },
      ),
    );
  }
}
