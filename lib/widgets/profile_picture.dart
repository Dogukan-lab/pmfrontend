import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.pathName,
    this.size = 100.0,
  });

  final String pathName;
  final double size;

  @override
  Widget build(BuildContext context) {
    var image = ClipOval(
        child: Image.asset(
      pathName,
      fit: BoxFit.cover,
    ));
    return SizedBox(
      width: size,
      height: size,
      child: image,
    );
  }
}
