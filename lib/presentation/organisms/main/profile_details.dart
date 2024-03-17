import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const HomePageHeader('Details', Cols.grey29),
          Expanded(
            child: Container(
              color: Cols.grey22,
            ),
          ),
        ],
      ),
    );
  }
}
