import 'package:flutter/material.dart';

class ColorPalettes{

  static Color deepPurple = Color(0xFF8973C6);
  static Color lightGreen = Color(0xFF6CA801);

  //Colors for theme
  static Color lightPrimary = Color(0xFF8973C6);
  static Color darkPrimary = Color(0xFF8973C6);
  static Color lightAccent = Color(0xFF6CA801);
  static Color darkAccent = Color(0xFF6CA801);
  static Color lightBG = Color(0xffE5E5E5);
  static Color darkBG = Color(0xff212121);

  static Color white = Color(0xffffffff);
  static Color whiteSemiTransparent = Colors.white70;
  static Color grey = Colors.grey;
  static Color greyBg = Color(0xfff0f0f0);
  static Color red = Color(0xffEB4134);
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
  static Color setActive = Colors.grey[500];
  static Color blueGrey = Colors.blueGrey;
  static Color black = Color(0xFF000000);
  static Color black12 = Colors.black12;
  static Color transparent = Color(0x00000000);

  static Color getColorCircleProgress(double s) {
    Color r = ColorPalettes.red;
    if (s > 4.5 && s < 7)
      r = ColorPalettes.yellow;
    else if (s >= 7) r = ColorPalettes.green;
    return r;
  }

}