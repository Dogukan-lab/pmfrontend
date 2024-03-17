import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

final settingsState = StateProvider<bool>((ref) => false);

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            final notifier = ref.read(settingsState.notifier);
            notifier.state = !notifier.state;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.largeMinus, vertical: Sizes.medium),
          child: Column(
            children: [
              //Header
              const HomePageHeader('Settings', Cols.grey29),

              //List
              Expanded(
                child: Container(
                  color: Cols.grey38,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
