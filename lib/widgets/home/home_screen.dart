import 'package:flutter/widgets.dart';
import 'package:pmfrontend/pale_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.smallPlus,
          color: Cols.grey38,
        ),
        Expanded(
          child: Container(
            color: Cols.grey33,
          ),
        ),
      ],
    );
  }
}
