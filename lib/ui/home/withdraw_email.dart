import 'dart:ui';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WithDrawEmail extends StatefulWidget {
  @override
  _WithDrawEmailState createState() => _WithDrawEmailState();
}

class _WithDrawEmailState extends State<WithDrawEmail> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double _value = 52.0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            height: size.height,
            child: ListView(
              children: [

                appBarWithText(size, context, "Withdraw", AppColors.bar_color,
                    () {
                  Navigator.of(context).pop();
                }),
                buildWithdrawArea(size, context),
                SizedBox(height: 30.h,),
              ],
            )),
      ),
    );
  }

  Container buildWithdrawArea(Size size, BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(
        children: [
          buildplayStoreIcon(
            size,
          ),
          buildSliderArea(size, context),
          SizedBox(
            height: 50.h,
          ),
          buildtextfieldarea(size, context),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}

Widget buildplayStoreIcon(Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 110.h, vertical: 30.h),
    child: Container(
      height: 200.h,
      //width: 100.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.background_color1,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.background_color1),
      child: Image.asset(
        "assets/images/playstore.png",
        height: 300,
      ),
    ),
  );
}

Widget buildSliderArea(Size size, BuildContext context) {
  // ignore: unused_local_variable
  int _lowerValue = 0;
  // ignore: unused_local_variable
  int _upperValue = 100;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Container(
      height: size.height * 0.45,
      width: size.width,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.background_color1,
          //     spreadRadius: 1,
          //     blurRadius: 5,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.background_color1),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 30.h, right: 30.w),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/pic 2.png",
                    scale: 1,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: Text(
                      "User ABCD",
                      style: GoogleFonts.raleway(
                          color: AppColors.greyColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "12345678",
                    style: GoogleFonts.openSans(
                        color: AppColors.greyColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 50, left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: FlutterSlider(
                  values: [0, 100],
                  max: 100,
                  min: 0,
                  step: FlutterSliderStep(step: 1),
                  jump: true,
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 6,
                    inactiveTrackBar: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    activeTrackBarHeight: 6,
                    activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Color(0XFF8A87F2),
                          Color(0XFFD87FE2),
                        ],
                      ),
                    ),
                  ),
                  tooltip: FlutterSliderTooltip(
                    boxStyle: FlutterSliderTooltipBox(
                      decoration: BoxDecoration(
                        color: AppColors.background_color1,
                      ),
                    ),
                    textStyle:
                        TextStyle(fontSize: 25, color: Color(0xFFD87FE2)),
                  ),
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFD87FE2),
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColors.background_color1,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  disabled: false,
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                  })),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h, left: 30.w, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0",
                  style: GoogleFonts.openSans(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                Text("Full", style: mediumextwhiteStyle)
              ],
            ),
          ),
          Text(
            "Minimum withdrawal value of 10 \u0024 and in\nmultiples of 10 ",
            style: subtitleStyle,
          )
        ],
      ),
    ),
  );
}

Widget buildtextfieldarea(Size size, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Container(
      height: size.height * .40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.background_color1,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.background_color1),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: '\u0024 15.00',
                  style: TextStyle(
                      color: AppColors.goldenColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                    text: '  (All Transactions in USD)',
                    style: TextStyle(
                        color: AppColors.goldenColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600)),
              ])),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "Enter your Google Play Store email address to\nrecieve voucher ( Vouchers will be delivered in 72\nhours )",
            style: smallwhiteStyle,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFields.normalTextField(
              context,
              color: Color(0xff50566C),
              hintText: "Email Adress",
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          RaisedGradientButton(
              width: 120,
              height: 30,
              child: Text(
                "Send",
                style: mediumwhiteStyle,
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0XFFDD7EE0).withOpacity(0.9),
                  Color(0XFF8787F2),
                ],
              ),
              onPressed: () {}),
        ],
      ),
    ),
  );
}
