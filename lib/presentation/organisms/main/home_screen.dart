import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/domain/usecases/get_searched_users_usecase.dart';
import 'package:pmfrontend/presentation/atoms/images/background_screen.dart';
import 'package:pmfrontend/presentation/atoms/headers/home_page_header.dart';
import 'package:pmfrontend/presentation/atoms/tools/custom_textfield.dart';
import 'package:pmfrontend/presentation/molecules/home/friends_list.dart';
import 'package:pmfrontend/presentation/molecules/home/searched_list.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

final searchedUsersProvider = StateProvider<List<Profile>>((ref) => []);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchTarget = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cols.grey33,
      child: BackgroundScreen(
        offset: const EdgeInsets.only(right: Sizes.large),
        child: Column(
          children: [
            //Header
            const HomePageHeader('Hallownest', Cols.grey38),

            //Seachbar
            Padding(
              padding: const EdgeInsets.fromLTRB(Pad.small, Pad.smallPlus, Pad.small, 0),
              child: CustomTextField(
                height: Sizes.small,
                backgroundColor: Cols.grey48,
                style: Styles.gg,
                hint: 'Search shades',
                hintStyle: Styles.ggGrey,
                init: (controller) {},
                onChanged: (value) {
                  setState(() {
                    _searchTarget = value;
                  });

                  if (_searchTarget.length >= 4) getSearchedUsers(ref, _searchTarget);
                },
              ),
            ),

            //Content
            Expanded(
              child: _searchTarget.length < 4 ? const FriendsList() : const SearchedList(),
            )
          ],
        ),
      ),
    );
  }
}
