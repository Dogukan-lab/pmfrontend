import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/data/repositories/server_handler.dart';
import 'package:pmfrontend/domain/entities/profile.dart';
import 'package:pmfrontend/presentation/organisms/main/home_screen.dart';

void getSearchedUsers(WidgetRef ref, String searchTarget) async {
  final response = await apiGet('PmUser/AllUsers', query: 'searchTarget=$searchTarget');

  if (response != null && response.statusCode == HttpStatus.ok) {
    List<dynamic> rawList = jsonDecode(
      response.body,
    );

    List<Profile> list = rawList.map((user) => Profile.fromJson(user)).toList();
    ref.read(searchedUsersProvider.notifier).state = list;
  }
}
