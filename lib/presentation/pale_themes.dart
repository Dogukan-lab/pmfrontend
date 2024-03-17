import 'package:flutter/material.dart';

//Colors
abstract class Cols {
  static const Color grey22 = Color.fromARGB(255, 22, 22, 22);
  static const Color grey29 = Color.fromARGB(255, 29, 29, 29);
  static const Color grey33 = Color.fromARGB(255, 33, 33, 33);
  static const Color grey38 = Color.fromARGB(255, 38, 38, 38);
  static const Color grey48 = Color.fromARGB(255, 48, 48, 48);
  static const Color grey75 = Color.fromARGB(255, 75, 75, 75);
  static const Color grey107 = Color.fromARGB(255, 107, 107, 107);
  static const Color red = Color.fromARGB(255, 176, 28, 17);
  static const Color green = Color.fromARGB(255, 17, 176, 54);
}

//Text Themes
abstract class Styles {
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
abstract class Radii {
  static const double small = 5;
}

//Padding
abstract class Pad {
  static const double smallMinus = 5;
  static const double small = 10;
  static const double smallPlus = 15;
  static const double mediumMinus = 20;
  static const double medium = 25;
  static const double mediumPlus = 35;
  static const double large = 50;
}

//Sizes
abstract class Sizes {
  static const double smallMinus = 20;
  static const double small = 50;
  static const double smallPlus = 65;
  static const double mediumMinus = 75;
  static const double medium = 100;
  static const double large = 200;
  static const double largePlus = 300;
}
