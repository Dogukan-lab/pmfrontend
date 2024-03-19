import 'package:flutter/material.dart';
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
                //Icon
                Padding(
                  padding: const EdgeInsets.only(top: Pad.mediumPlus, bottom: Pad.mediumMinus),
                  child: ProfilePicture(profile.icon, Sizes.large),
                ),

                //Name and status
                HallownestHeader(profile.username, size: 45, center: true),
                HallownestHeader(profile.status, size: 20, center: true),

                //Bio
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Pad.mediumMinus),
                  child: Container(
                    width: Sizes.large,
                    height: Pad.small,
                    decoration: BoxDecoration(
                      color: Cols.grey48,
                      borderRadius: BorderRadius.circular(Radii.small),
                    ),
                  ),
                ),
                HallownestHeader(profile.bio, size: 25, center: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
