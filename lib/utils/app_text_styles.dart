import 'package:flutter/material.dart';

class TextStyles {
  //Custom TextStyles here
  static const TextStyle largeFontStyle = TextStyle(
    fontSize: 24,
    fontFamily: "Raleway",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonFontText = TextStyle(
    color: Colors.black,
    height: 1.5,
    fontFamily: "Raleway"
  );
  static const TextStyle homeLabelTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      letterSpacing: 1,fontFamily: "Raleway");
  static const TextStyle smallFontSize = TextStyle(
    fontSize: 12,
    height: 1.5,
  );
}
