import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/hallownest_header.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/molecules/home/home_list_item.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/people/online_users_state.dart';
import 'package:pmfrontend/presentation/states/people/profile_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _searchTarget = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cols.grey33,
      child: Column(
        children: [
          //Header
          const HomePageHeader('Hallownest', Cols.grey38),

          //Seachbar
          Padding(
            padding: const EdgeInsets.fromLTRB(Pad.small, Pad.smallPlus, Pad.small, 0),
            child: Container(
              height: Sizes.small,
              decoration: BoxDecoration(
                color: Cols.grey48,
                borderRadius: BorderRadius.circular(Radii.small),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchTarget = value),
                style: Styles.ggGrey,
                cursorColor: Cols.grey107,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: Pad.small),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          //Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer(
                builder: (_, ref, child) {
                  final friends = List<Profile>.from(ref.watch(profileProvider).friends);
                  final searched = List<Profile>.from(ref.watch(searchedUsersProvider));

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

                  //Remove duplicates
                  searched.removeWhere((user) {
                    for (var other in friends) {
                      if (user.username == other.username) return true;
                    }

                    return false;
                  });

                  //Sorting
                  friends.sort((a, b) => a.username.compareTo(b.username));
                  searched.sort((a, b) => a.username.compareTo(b.username));

                  //Searching
                  friends.retainWhere((user) => user.username.toLowerCase().contains(_searchTarget.toLowerCase()));
                  searched.retainWhere((user) => user.username.toLowerCase().contains(_searchTarget.toLowerCase()));

                  //List
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(Pad.smallPlus, Pad.smallPlus, Pad.smallPlus, 0),
                    child: Column(
                      children: [
                        //Friends
                        const HallownestHeader('Friendly shades'),
                        for (int i = 0; i < friends.length; i++)
                          HomeListItem(
                            user: friends[i],
                            isLast: i == friends.length - 1,
                          ),

                        //Divider
                        const SizedBox(height: Pad.smallPlus),

                        //Other
                        const HallownestHeader('Other shades'),
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
            ),
          )
        ],
      ),
    );
  }
}
