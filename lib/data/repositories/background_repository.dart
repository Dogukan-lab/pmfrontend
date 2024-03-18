final BackgroundRepository backgroundRepository = BackgroundRepository();
const int amountOfBackgrounds = 4;
const String path = 'backgrounds/';

class BackgroundRepository {
  List<String> backgrounds = [];

  BackgroundRepository() {
    for (var i = 0; i < amountOfBackgrounds; i++) {
      backgrounds.add('${path}background_$i.png');
    }
  }

  String getBackground(int i) => backgrounds[i];
}
