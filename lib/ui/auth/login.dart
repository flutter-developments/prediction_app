import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
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
                  child: Container(
                    height: 190.h,
                    width: size.width*0.36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                        ),
                        color: AppColors.background_color1),
                    child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
                  ),
                ),
              ),
              Container(
                  color: AppColors.bar_color, child: buildTransection(size)),
              isSignup == true
                  ? Column(
                      children: [
                        Container(
                          height: size.height * .65,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: AppColors.bar_color),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
                                ),
                                TextFields.normalTextField(context,
                                    color: Colors.white,
                                    hintText: "Email Address",
                                    icon: Icons.email),
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextFields.normalTextField(context,
                                    color: Colors.white,
                                    hintText: "Password",
                                    icon: Icons.vpn_key),
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextFields.normalTextField(context,
                                    color: Colors.white,
                                    hintText: "Confirm Password",
                                    icon: Icons.vpn_key),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  "OR Sign Up With",
                                  style: GoogleFonts.raleway(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.whiteColor),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        child: Image.asset(
                                            "assets/images/google.png")),
                                    InkWell(
                                        child:
                                            Image.asset("assets/images/fb.png"))
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account ?",
                                      style: smallwhiteStyle,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    InkWell(
                                        child: Text("Sign In",
                                            style: GoogleFonts.raleway(
                                                fontSize: 15.sp,
                                                color: AppColors.gradiantColor1,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        RaisedGradientButton(
                            width: 120,
                            height: 30,
                            child: Text(
                              "Sign Up",
                              style: mediumwhiteStyle,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {
                               AppRoutes.push(context, MainScreen());
                            }),
                            SizedBox(height: 40.h,)
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: size.height * .55,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: AppColors.bar_color),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
                                ),
                                TextFields.normalTextField(context,
                                    color: Colors.white,
                                    hintText: "Email Address",
                                    icon: Icons.email),
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextFields.normalTextField(context,
                                    color: Colors.white,
                                    hintText: "Password",
                                    icon: Icons.vpn_key),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text("OR Sign In With",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor)),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        child: Image.asset(
                                            "assets/images/google.png")),
                                    InkWell(
                                        child:
                                            Image.asset("assets/images/fb.png"))
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account ?",
                                      style: smallwhiteStyle,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    InkWell(
                                        child: Text("Sign Up",
                                            style: GoogleFonts.raleway(
                                                fontSize: 15.sp,
                                                color: AppColors.gradiantColor1,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        RaisedGradientButton(
                            width: 120,
                            height: 30,
                            child: Text(
                              "Sign In",
                              style: mediumwhiteStyle,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {}),
                            SizedBox(height: 40.h,)
                      ],
                    )
            ],
          )),
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
              setState(() {
                isSignup = true;
              });
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
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSignup = false;
              });
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
                  "Sign In",
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
