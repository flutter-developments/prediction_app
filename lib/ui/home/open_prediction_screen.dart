import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/custom_appbar.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prediction_app/utils/routes.dart';

import 'exchange_history.dart';

class OpenPredictionScreen extends StatefulWidget {
  @override
  _OpenPredictionScreenState createState() => _OpenPredictionScreenState();
}

class _OpenPredictionScreenState extends State<OpenPredictionScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primery_color,
        key: _key,
        drawer: DrawerFull(context, MediaQuery.of(context).size),
        body: Container(
            child: ListView(
          children: [
            buildappbarContainer(size, context),
            SizedBox(
              height: 30.h,
            ),
            buildpredictionScreen(size),
          ],
        )),
      ),
    );
  }

  Container buildpredictionScreen(
    Size size,
  ) {
    return Container(
      height: size.height * .85,
      width: size.width,
      color: AppColors.primery_color,
      child: Column(
        children: [
          Container(
            height: size.height * .20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsContainer(title: "Predictions", stats: '255'),
                  StatsContainer(title: "Wins", stats: '35'),
                  StatsContainer(title: "Winrate", stats: '32%'),
                ],
              ),
            ),
          ),
        ],
      ),
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * .02,
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
                        width: size.width * .03,
                      ),
                      Text(
                        "Get Credit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, ExchangeHistory());
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
