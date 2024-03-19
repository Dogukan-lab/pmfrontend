import 'package:flutter/widgets.dart';
import 'package:pmfrontend/data/repositories/icon_repository.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(this.icon, this.size, this.outlineSize, {super.key});

  final int icon;
  final double size;
  final double outlineSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            color: Cols.grey48,
          ),
        ),
        Image.asset(
          iconRepository.getIcon(icon),
          width: size - outlineSize,
          height: size - outlineSize,
        ),
      ],
    );
  }
}
