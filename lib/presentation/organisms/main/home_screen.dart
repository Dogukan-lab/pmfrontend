import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmfrontend/presentation/atoms/home_page_header.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

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
                  // final state = ref.read(provider);

                  return Column(
                    children: [],
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
