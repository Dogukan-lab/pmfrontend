import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/molecules/home/profile_card.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';
import 'package:pmfrontend/presentation/states/online_users_state.dart';
import 'package:pmfrontend/presentation/states/profile_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cols.grey33,
      child: Column(
        children: [
          //Header
          const HomePageHeader('Hallownest', Cols.grey38),

          //List
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer(
                builder: (_, ref, child) {
                  final friends = List<Profile>.from(ref.watch(profileProvider).friends);
                  final online = List<Profile>.from(ref.watch(onlineUsersProvider));

                  online.removeWhere((user) {
                    for (var other in friends) {
                      if (user.username == other.username) return true;
                    }

                    return false;
                  });

                  return Column(
                    children: [
                      //Friends
                      const Text('Friendly shades'),

                      for (var user in friends)
                        ProfileCard(
                          name: user.username,
                          text: user.bio,
                          icon: user.icon,
                          online: user.online,
                        ),

                      //Other
                      const Text('Other shades'),

                      for (var user in online)
                        ProfileCard(
                          name: user.username,
                          text: user.bio,
                          icon: user.icon,
                          online: user.online,
                        ),
                    ],
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
