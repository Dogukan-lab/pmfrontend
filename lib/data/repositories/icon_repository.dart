final IconRepository iconRepository = IconRepository();
const int amountOfIcons = 10;
const String path = 'profile_icons/';

class IconRepository {
  List<String> icons = [];

  IconRepository() {
    for (var i = 0; i < amountOfIcons; i++) {
      icons.add('${path}icon_$i.png');
    }
  }

  String getIcon(int i) => i == -1 ? '$path/icon_default.png' : icons[i];
}
