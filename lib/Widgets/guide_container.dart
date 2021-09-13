import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuideContainer extends StatelessWidget {
  final String title;
  final String buttonText;
  final String link;
  final VoidCallback onPressed;

  const GuideContainer(
      {required this.title,
      required this.onPressed,
      required this.buttonText,
      required this.link});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.background_color1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0.h, left: 15.w, right: 15.w, bottom: 30.h),
              child: Image.asset(
                link,
                scale: 1.1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: largeFontStyle,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GradientButton(title: buttonText, onPressed: onPressed),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
