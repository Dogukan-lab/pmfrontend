import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/headers/hallownest_header.dart';
import 'package:pmfrontend/presentation/atoms/headers/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/images/profile_picture.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/chat/chat_state.dart';

class ProfileDetails extends ConsumerWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(chatProvider).profile;

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const HomePageHeader('Details', Cols.grey29),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Pad.mediumPlus, bottom: Pad.mediumMinus),
                  child: ProfilePicture(profile.icon, Sizes.large),
                ),
                HallownestHeader(profile.username, size: 45, center: true),
                HallownestHeader(profile.status, size: 25, center: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
