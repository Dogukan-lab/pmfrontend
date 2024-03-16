import 'package:flutter/material.dart';

//Colors
class Cols {
  static const Color grey22 = Color.fromARGB(255, 22, 22, 22);
  static const Color grey29 = Color.fromARGB(255, 29, 29, 29);
  static const Color grey33 = Color.fromARGB(255, 33, 33, 33);
  static const Color grey38 = Color.fromARGB(255, 38, 38, 38);
  static const Color grey54 = Color.fromARGB(255, 54, 54, 54);
  static const Color grey64 = Color.fromARGB(255, 64, 64, 64);
  static const Color grey107 = Color.fromARGB(255, 107, 107, 107);
  static const Color red = Color.fromARGB(255, 176, 28, 17);
}

//Text Themes
class Styles {
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

  static TextStyle ggGrey = gg.copyWith(color: Cols.grey107);

  static TextStyle header = trajan.copyWith(fontSize: 30);
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
  static const double smallMinus = 20;
  static const double small = 50;
  static const double smallPlus = 65;
  static const double medium = 100;
  static const double large = 200;
  static const double largePlus = 300;
}
