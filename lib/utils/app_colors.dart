import 'package:flutter/material.dart';

class AppColors {
  static const Color primery_color = const Color(0xff343E53);
  static const Color whiteTextColor = Colors.white;
  static const Color bar_color = const Color(0xFF1A1F2A);
    static const Color background_color = const Color(0xFF31374b);
  static const Color greyButtonColor = const Color(0xFF828FAE);
  static const Color greyColor = const Color(0xFF808080);
  static const Color redColor = const Color(0xFFF24A4A);
  static const Color orangeColor = const Color(0xFFFEB42F);
  static const Color goldenColor = const Color(0xFFFEBE35);
  static const Color greenColor = const Color(0xFF26D142);
  static const Color skyBlueColor = const Color(0xFFF3F6FA);
  static const Color white = const Color(0xFFFFFFFF);
  static const Color lightgrey = const Color(0xFF9F9F9);
  static const Color whiteColor = const Color(0xFFFFFFFF);
  static const Color greyTextColor = const Color(0xFF828FAE);
  static const Color greyLocationIconColor = const Color(0xFFAAAAAA);
  static const Color chatAppBarColor = const Color(0xFFE6E6E6);
  static const Color NavigateTextColor = const Color(0xFF1FAFFC);
  static const Color ChatTextColor = const Color(0xFF26D142);
  static const Color CancelTextColor = const Color(0xFFFF2C2C);
  static const Color ChartBarColor = const Color(0xFFFEBE34);
  static const Color halfWhite = const Color(0xFFF3F3F3);
  static const Color ChatOneSideCOlor = const Color(0xFFF3F6FA);
  static const Color blueTextColor = const Color(0X169DFF);

  static LinearGradient background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0XFFFFFFFF),
      Color(0XFFFFFFFE),
      Color(0XFFFFFEF1),
      Color(0XFFFFFEF2),
    ],
  );
  static LinearGradient timebackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Colors.white,
      Color(0XFFE3E3E3).withOpacity(.7),
      Color(0XFFE3E3E3).withOpacity(.7),
      Color(0XFFE3E3E3).withOpacity(.7),
      Colors.white,
      Colors.white,
    ],
  );
  static LinearGradient appBar = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0XFFFDFDFD),
      Color(0XFFFCFCFC),
      Color(0XFFFBFBFB),
      Color(0XFFFAFAFA),
      Color(0XFFF5F5F5),
      Color(0XFFF5F5F5),
      Color(0XFFF4F4F3),
      Color(0XFFF6F6F6),
    ],
  );
}
