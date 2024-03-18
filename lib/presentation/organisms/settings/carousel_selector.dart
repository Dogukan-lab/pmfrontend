import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/other/settings_state.dart';

class CarouselSelector extends StatefulWidget {
  const CarouselSelector({
    super.key,
    required this.amount,
    required this.fraction,
    required this.initial,
    required this.onChange,
    required this.child,
  });

  final int amount;
  final double fraction;
  final int Function(WidgetRef ref) initial;
  final void Function(
    SettingsState state,
    SettingsNotifier notifier,
    int index,
  ) onChange;
  final Widget Function(int index) child;

  @override
  State<CarouselSelector> createState() => _CarouselSelectorState();
}

class _CarouselSelectorState extends State<CarouselSelector> {
  final _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (_, ref, __) {
          final initial = widget.initial(ref);

          return CarouselSlider.builder(
            itemCount: widget.amount,
            carouselController: _controller,
            itemBuilder: (_, index, __) => widget.child(index),
            options: CarouselOptions(
              viewportFraction: widget.fraction,
              height: Sizes.large,
              onPageChanged: (index, _) {
                final state = ref.read(settingsState);
                final notifier = ref.read(settingsState.notifier);
                widget.onChange(state, notifier, index);
              },
              initialPage: initial == -1 ? 0 : initial,
            ),
          );
        },
      ),
    );
  }
}
