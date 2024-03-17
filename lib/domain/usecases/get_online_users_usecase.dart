import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/states/people/online_users_state.dart';

void getOnlineUsers(WidgetRef ref) async {
  await Future.delayed(const Duration(seconds: 1));

  ref.read(onlineUsersProvider.notifier).addUsers([
    const Profile('Heirloomless', 'Heirloomless status', 5, false),
    const Profile('LarsingDash', 'LarsingDash statsu', 4, true),
    const Profile('Owon', 'Owon status', 0, false),
    const Profile('Owon1', 'Owon status', 0, false),
    const Profile('Owon2', 'Owon status', 0, false),
    const Profile('Owon3', 'Owon status', 0, false),
    const Profile('Owon4', 'Owon status', 0, false),
    const Profile('Owon5', 'Owon status', 0, false),
    const Profile('Owon6', 'Owon status', 0, false),
    const Profile('Owon7', 'Owon status', 0, false),
  ]);
}
