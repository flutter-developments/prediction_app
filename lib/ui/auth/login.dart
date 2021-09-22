import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';

class Auth extends StatefulWidget {
  final bool isSignup;

  const Auth({Key? key, required this.isSignup}) : super(key: key);
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // ignore: unused_field
  TextEditingController _emailController = TextEditingController();
  // ignore: unused_field
  TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  TextEditingController _conformPasswordController = TextEditingController();

  bool isSignup = true;
  void initState() {
    super.initState();
    isSignup = widget.isSignup;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              //SizedBox(height: 10),
              Container(
                height: size.height * .22,
                width: size.width,
                decoration: BoxDecoration(color: AppColors.primery_color),
                child: Center(
                  child: Container(
                    height: 130.h,
                    width: size.width * 0.50,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.only(
                    //       bottomLeft: Radius.circular(10.0),
                    //     ),
                    //     color: AppColors.background_color1),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                  color: AppColors.bar_color, child: buildTransection(size)),
              isSignup == true
                  ? Column(
                      children: [
                        Container(
                          height: size.height * .55,
                          width: size.width,
                          decoration: BoxDecoration(
                             
                              color: AppColors.bar_color),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
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
                                  height: 20.h,
                                ),
                                Text(
                                  "OR Sign Up With",
                                  style: GoogleFonts.raleway(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.whiteColor),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                        child: Image.asset(
                                            "assets/images/google.png",height: 60.h,)),
                                    GestureDetector(
                                        child:
                                            Image.asset("assets/images/fb.png",height: 60.h,))
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account ?",
                                      style: GoogleFonts.raleway(
                                                fontSize: 14.sp,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignup = false;
                                          });
                                        },
                                        child: Text("Sign In",
                                            style: GoogleFonts.raleway(
                                                fontSize: 14.sp,
                                                color: AppColors.gradiantColor1,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        RaisedGradientButton(
                            width: 150.w,
                            height: 50.h,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.whiteColor),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {
                              AppRoutes.push(context, Welcome());
                            }),
                        SizedBox(
                          height: 40.h,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: size.height * .47,
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
                                  height: 50.h,
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
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor)),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                        child: Image.asset(
                                            "assets/images/google.png",height: 60.h,)),
                                    GestureDetector(
                                        child:
                                            Image.asset("assets/images/fb.png",height: 60.h))
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
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isSignup = true;
                                          });
                                        },
                                        child: Text("Sign Up",
                                            style: GoogleFonts.raleway(
                                                fontSize: 14.sp,
                                                color: AppColors.gradiantColor1,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        RaisedGradientButton(
                            width: 140.w,
                            height: 50.h,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.whiteColor),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0XFFDD7EE0).withOpacity(0.9),
                                Color(0XFF8787F2),
                              ],
                            ),
                            onPressed: () {
                              AppRoutes.push(context, Welcome());
                            }),
                        SizedBox(
                          height: 40.h,
                        )
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
                  style: TextStyle(
                                  fontSize: 18.sp, color: AppColors.whiteColor),
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
                  style: TextStyle(
                                  fontSize: 18.sp, color: AppColors.whiteColor),
                            ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
