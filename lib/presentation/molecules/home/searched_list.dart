import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/headers/hallownest_header.dart';
import 'package:pmfrontend/presentation/molecules/home/home_list_item.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class SearchedList extends StatelessWidget {
  const SearchedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Consumer(
        builder: (_, ref, child) {
          final searched = List<Profile>.from(ref.watch(searchedUsersProvider));
          ref.watch(profileProvider);

          //Loading
          if (searched.isEmpty) {
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

          //Sorting
          searched.sort((a, b) => a.username.compareTo(b.username));

          //List
          return Padding(
            padding: const EdgeInsets.fromLTRB(Pad.smallPlus, Pad.smallPlus, Pad.smallPlus, 0),
            child: Column(
              children: [
                //Searched
                const HallownestHeader('Found shades'),
                for (int i = 0; i < searched.length; i++)
                  HomeListItem(
                    user: searched[i],
                    isLast: i == searched.length - 1,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
