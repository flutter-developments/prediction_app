import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            color: AppColors.primery_color,
            child: ListView(
              children: [
                buildApp_bar(size, context),
                SizedBox(
                  height: 20.h,
                ),
                buildSuper_leauge(size),
              ],
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container buildSuper_leauge(Size size) {
    return Container(
      // color: AppColors.primery_color,
      height: size.height * .85,
      width: size.width,
      child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Card(
                child: Container(
                  height: size.height * .30,
                  width: size.width * .491,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(sports[index].image, fit: BoxFit.cover),
                      ClipRRect(
                        // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ScaleText(sports[index].title, Colors.white,
                                    23.sp, FontWeight.bold),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      sports[index].games,
                                      style: GoogleFonts.openSans(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      "Live Championships",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
