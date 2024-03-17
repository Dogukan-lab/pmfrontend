import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Header
          const HomePageHeader('Settings', Cols.grey29),

          //List
          Expanded(
            child: Container(
              color: Cols.green,
            ),
          ),

          //Profile Card
        ],
      ),
    );
  }
}
