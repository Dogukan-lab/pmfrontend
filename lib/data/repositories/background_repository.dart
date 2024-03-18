final BackgroundRepository backgroundRepository = BackgroundRepository();
const int amountOfIcons = 10;
const String path = 'backgrounds/';

class BackgroundRepository {
  List<String> backgrounds = [];

  BackgroundRepository() {
    for (var i = 0; i < amountOfIcons; i++) {
      backgrounds.add('${path}background_$i.png');
    }
  }

  String getBackground(int i) => backgrounds[i];
}
