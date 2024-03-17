import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/profile_picture.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat_state.dart';

class ProfileDetails extends ConsumerWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider).profile;

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const HomePageHeader('Details', Cols.grey29),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Pad.small),
              child: Column(
                children: [
                  ProfilePicture(state.icon, Sizes.largePlus),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
