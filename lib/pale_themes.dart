import 'package:flutter/material.dart';

//Colors
class Cols {
  static const Color darkGrey = Color.fromARGB(255, 107, 107, 107);
  static const Color red = Color.fromARGB(255, 176, 28, 17);
}

//Text Themes
class Fonts {
  static const TextStyle trajan = TextStyle(
    fontFamily: 'TrajanPro',
    fontSize: 15,
    color: Colors.white,
  );

  static const TextStyle gg = TextStyle(
    fontFamily: 'gg_sans',
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle ggGrey = gg.copyWith(color: Cols.darkGrey);
}

//Radii
class Radii {
  static const double small = 5;
}

//Padding
class Pad {
  static const double smallMinus = 5;
  static const double small = 10;
  static const double smallPlus = 15;
  static const double medium = 25;
  static const double mediumPlus = 35;
  static const double large = 50;
}

//Sizes
class Sizes {
  static const double small = 50;
  static const double medium = 100;
  static const double large = 200;
  static const double largePlus = 300;
}
