import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/withdraw_email.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeScreen1 extends StatefulWidget {
  @override
  _ExchangeScreen1State createState() => _ExchangeScreen1State();
}

class _ExchangeScreen1State extends State<ExchangeScreen1> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                buildappbarContainer(size, context),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildColumn(size, "Google PlayStore", "\u0024 15.00 ",
                          () {
                        AppRoutes.push(context, WithDrawEmail());
                      }, "assets/images/playstore.svg"),
                      buildColumn(size, "Apple App Store", "\u0024 15.00 ", () {
                        AppRoutes.push(context, WithDrawEmail());
                      }, "assets/images/apple.svg")
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildColumn(size, "PayPal", "\u0024 15.00 ", () {
                        AppRoutes.push(context, WithDrawEmail());
                      }, "assets/images/paypal.svg"),
                      buildColumn(size, "MasterCard", "\u0024 15.00 ", () {
                        AppRoutes.push(context, WithDrawEmail());
                      }, "assets/images/master.svg")
                    ],
                  ),
                ),
                SizedBox(height: 40.h)
              ],
            )),
      ),
    );
  }

  Column buildColumn(Size size, String title, String subtitle,
      VoidCallback onPressed, String link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.20,
          width: size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.background_color1,
          ),
          child: Center(
              child: SvgPicture.asset("assets/images/master.svg",
                  color: Colors.white)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(title,
              textAlign: TextAlign.start,
              style: GoogleFonts.openSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.goldenColor),
        ),
        SizedBox(height: 10.h),
        RaisedGradientButton(
            width: 120.w,
            height: 45.h,
            child: Text(
              "Exchange",
              style: subtitleStyle,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0XFFDD7EE0).withOpacity(0.9),
                Color(0XFF8787F2).withOpacity(0.9),
              ],
            ),
            onPressed: () {
              AppRoutes.push(context, WithDrawEmail());
            }),
      ],
    );
  }

  //appbar
  Container buildappbarContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * .150,
      width: size.width,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 10,
              offset: Offset(7.0, 7.0),
              blurRadius: 10.0,
              color: AppColors.background_color1,
            ),
          ],
          color: AppColors.primery_color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/pic 2.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "1000",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * .01,
                      ),
                      Image.asset("assets/images/Group.png"),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, Notifications());
                      },
                      child:
                          Image.asset("assets/images/appbar_notification.png")),
                ],
              ),
            ),
            //second row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, HomeScreen());
                      },
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 20.sp,
                        onPressed: () {
                          AppRoutes.pop(context);
                        },
                      )),
                  Row(
                    children: [
                      Image.asset("assets/images/Group 20.png"),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        "Get Credit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, ExchangeScreen1());
                      },
                      child: Image.asset("assets/images/Group 24.png"))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
