import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/background_repository.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
    this.offset = EdgeInsets.zero,
    required this.child,
  });

  final EdgeInsets offset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        IgnorePointer(
          child: Padding(
            padding: const EdgeInsets.all(Pad.mediumPlus).add(offset),
            child: Consumer(
              builder: (_, ref, __) {
                final background = ref.watch(profileProvider).background + 3;
                return Image.asset(
                  backgroundRepository.getBackground(background),
                  colorBlendMode: BlendMode.srcOver,
                );
              },
            ),
          ),
        ),
        child,
      ],
    );
  }
}
