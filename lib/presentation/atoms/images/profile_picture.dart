import 'package:flutter/widgets.dart';
import 'package:pmfrontend/data/repositories/icon_repository.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(this.icon, this.size, {super.key});

  final int icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Cols.grey48,
          width: size / 25,
        ),
        borderRadius: BorderRadius.circular(size),
        backgroundBlendMode: BlendMode.src,
        color: Cols.grey48,
      ),
      child: Image.asset(
        iconRepository.getIcon(icon),
        width: size,
        height: size,
      ),
    );
  }
}
