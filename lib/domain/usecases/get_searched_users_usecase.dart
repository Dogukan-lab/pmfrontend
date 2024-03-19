import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';

void getSearchedUsers(WidgetRef ref, String searchTarget) async {
  // await Future.delayed(const Duration(seconds: 1));

  final debugUsers = [
    const Profile(username: 'Heirloomless', status: 'Heirloomless status', bio: 'Heirloomless bio', icon: 5, online: false),
    const Profile(username: 'LarsingDash', status: 'LarsingDash statsu', bio: 'LarsingDash bio', icon: 4, online: true),
    const Profile(username: 'Owon', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon1', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon2', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon3', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon4', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon5', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon6', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
    const Profile(username: 'Owon7', status: 'Owon status', bio: 'Owon bio', icon: 0, online: false),
  ];

  debugUsers.retainWhere((user) => user.username.toLowerCase().contains(searchTarget.toLowerCase()));

  ref.read(searchedUsersProvider.notifier).state = debugUsers;
}
