import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/user_guide/user_guide1.dart';
import 'package:prediction_app/ui/user_guide/user_guide2.dart';
import 'package:prediction_app/ui/user_guide/user_guide_4.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumUpgrade extends StatefulWidget {
  @override
  _PremiumUpgradeState createState() => _PremiumUpgradeState();
}

class _PremiumUpgradeState extends State<PremiumUpgrade> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                // buildApp_only_title_bar(
                //     size, context, "Upgrade", AppColors.background_color),
                appBarWithText(size, context, "Upgrade", AppColors.bar_color,
                    () {
                  Navigator.of(context).pop();
                }),
                build_premium(size),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 134.w),
                  child: RaisedGradientButton(
                    child: Text(
                      "Upgrade",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      AppRoutes.push(context, UserGuide4());
                    },
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFDD7EE0),
                        Color(0XFF8787F2),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            )),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
build_premium(Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 15.w,
    ),
    child: Container(
      height: size.height * .85,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Upgrade to",
              style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          //WavyText("Premium", Color(0xffD87FE2), 33.sp, FontWeight.w800),
          Text(
            "Premium",
            style: GoogleFonts.raleway(
                color: Color(0xffD87FE2),
                fontSize: 33.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: 186.w,
            height: 200.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.background_color1),
            child: Image.asset(
              "assets/images/Vector.png",
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              width: size.width * 0.95,
              height: 385.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background_color1),
              child: ListView(
                children: [
                  build_premiumlist(() {}, "Premium Benefit", "1", size),
                  build_premiumlist(() {}, "Premium Benefit", "2", size),
                  build_premiumlist(() {}, "Premium Benefit", "3", size),
                  build_premiumlist(() {}, "Premium Benefit", "4", size),
                  build_premiumlist(() {}, "Premium Benefit", "5", size)
                ],
              )),
        ],
      ),
    ),
  );
}

Widget build_premiumlist(
    VoidCallback onPressed, String title, String subtitle, Size size) {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 30.h,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.sp,
            backgroundColor: Color(0xffD6A700),
            child: Center(
              child: Icon(
                Icons.done,
                color: Colors.black,
                size: 30.sp,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            title,
            style: GoogleFonts.raleway(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            subtitle,
            style: GoogleFonts.openSans(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.whiteColor),
          ),
        ],
      ),
    ),
    onTap: onPressed,
  );
}
