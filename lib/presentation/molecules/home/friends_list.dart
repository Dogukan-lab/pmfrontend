import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/headers/hallownest_header.dart';
import 'package:pmfrontend/presentation/molecules/home/home_list_item.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Consumer(
        builder: (_, ref, child) {
          final friends = List<Profile>.from(ref.watch(profileProvider).friends);

          //Loading
          if (friends.isEmpty) {
            return const Padding(
              padding: EdgeInsets.only(top: Pad.medium),
              child: SizedBox(
                width: Sizes.smallPlus,
                height: Sizes.smallPlus,
                child: CircularProgressIndicator(
                  color: Cols.grey75,
                  strokeWidth: 7.5,
                ),
              ),
            );
          }

          //Splitting online / offline and sorting
          final online = friends.where((user) => user.online).toList();
          final offline = friends.where((user) => !user.online).toList();
          online.sort((a, b) => a.username.compareTo(b.username));
          offline.sort((a, b) => a.username.compareTo(b.username));

          //List
          return Padding(
            padding: const EdgeInsets.fromLTRB(Pad.smallPlus, Pad.smallPlus, Pad.smallPlus, 0),
            child: Column(
              children: [
                //Online
                const HallownestHeader('Offlien shades'),
                for (int i = 0; i < online.length; i++)
                  HomeListItem(
                    user: friends[i],
                    isLast: i == friends.length - 1,
                  ),

                //Divider
                const SizedBox(height: Pad.smallPlus),

                //Offline
                const HallownestHeader('Online shades'),
                for (int i = 0; i < offline.length; i++)
                  HomeListItem(
                    user: offline[i],
                    isLast: i == offline.length - 1,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
