import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/molecule/profile/profile_picture.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    this.roundedRadius,
  });

  final double? roundedRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('html.document.cookie'),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: roundedRadius != null ? BorderRadius.all(Radius.circular(roundedRadius!)) : BorderRadius.zero,
          color: const Color.fromARGB(255, 221, 220, 220),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfilePicture(
              pathName: 'lmao.jpg',
              size: 300.0,
            ),
            Text(
              'Bob',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
