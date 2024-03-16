import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomePageHeader('Vessels', Cols.grey29),
        Expanded(
          child: Container(
            color: Cols.grey22,
          ),
        ),
      ],
    );
  }
}
