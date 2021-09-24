import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//Custom TextStyles here
// ignore: non_constant_identifier_names
Widget WavyText(String text, Color color, double size, FontWeight fontWeight) {
  return DefaultTextStyle(
    style: GoogleFonts.raleway(
        fontSize: size, letterSpacing: 1, fontWeight: fontWeight, color: color),
    child: AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText(text),
      ],
      isRepeatingAnimation: false,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget ScaleText(String text, Color color, double size, FontWeight fontWeight) {
  return DefaultTextStyle(
    style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    child: AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(text),
      ],
      isRepeatingAnimation: true,
    ),
  );
}

final subtitleStyle = GoogleFonts.raleway(
    fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.whiteColor);

final titlegreyStyle = GoogleFonts.raleway(
    fontSize: 15.sp, fontWeight: FontWeight.w500, color: Color(0xffB6B6B6));
final titlegoldan = GoogleFonts.raleway(
    fontSize: 15.sp, fontWeight: FontWeight.w700, color: Color(0xffF3C624));

final mediumwhiteStyle = GoogleFonts.raleway(
    fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColors.whiteColor);

final subtitleStyle1 = GoogleFonts.raleway(
    fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.greyColor);

final largetextwhiteStyle = TextStyle(
    fontSize: 40.sp, fontWeight: FontWeight.bold, color: AppColors.white);
final largetextVSStyle = TextStyle(
    fontSize: 35.sp, fontWeight: FontWeight.bold, color: AppColors.white);
final mediumextwhiteStyle = GoogleFonts.raleway(
    fontSize: 23.sp, fontWeight: FontWeight.bold, color: AppColors.white);

final smallwhiteStyle = GoogleFonts.raleway(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteTextColor);

final goldensubtitleStyle1 = TextStyle(
    letterSpacing: 1,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.goldenColor);

final TextStyle buttonFontText =
    TextStyle(color: Colors.black, height: 1.5, fontFamily: "Raleway");

final TextStyle homeLabelTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 1,
    fontFamily: "Raleway");
final TextStyle smallFontSize = TextStyle(
  fontSize: 12,
  height: 1.5,
);
