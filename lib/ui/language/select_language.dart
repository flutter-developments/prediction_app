import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/ui/auth/login.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isSignup = true;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Container(
                height: size.height * .30,
                width: size.width,
                decoration: BoxDecoration(color: AppColors.primery_color),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 190.h,
                        width: size.width * 0.36,
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.only(
                        //       bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0),topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)
                        //     ),
                        //   //  color: AppColors.background_color1
                        //     ),
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Sportica".toUpperCase(),
                        style: mediumextwhiteStyle,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  color: AppColors.bar_color, child: buildTransection(size)),
              Column(
                children: [
                  Container(
                    height: size.height * .65,
                    width: size.width,
                    color: AppColors.bar_color,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(size,
                                    "assets/images/england-flag.jpg", "English")
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(size,
                                    "assets/images/england-flag.jpg", "English")
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(
                                    size,
                                    "assets/images/england-flag.jpg",
                                    "English"),
                                buildavatar(size,
                                    "assets/images/england-flag.jpg", "English")
                              ],
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedGradientButton(
                          width: 120,
                          height: 30,
                          child: Text(
                            "Sign Up",
                            style: subtitleStyle,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0XFFDD7EE0).withOpacity(0.9),
                              Color(0XFF8787F2),
                            ],
                          ),
                          onPressed: () {
                            AppRoutes.push(context, Auth(isSignup: true));
                          }),
                      GradientButton(
                          title: "Sign In",
                          onPressed: () {
                            AppRoutes.push(context, Auth(isSignup: false));
                          })
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget buildavatar(Size size, String link, String title) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            link,
            scale: 5,
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Container buildTransection(Size size) {
    return Container(
      height: size.height * .06,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.9],
          colors: [AppColors.background_color, AppColors.bar_color],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // setState(() {
              //   isSignup = true;
              // });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == true
                      ? BorderRadius.only(
                          topRight: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        ),
                  color: isSignup == true
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "Choose language",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // setState(() {
              //   isSignup = false;
              // });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == false
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                        ),
                  color: isSignup == false
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
