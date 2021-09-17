import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/custom_appbar.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/prediction_screen.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'exchange_screen1.dart';

class OpenPredictionScreen extends StatefulWidget {
  @override
  _OpenPredictionScreenState createState() => _OpenPredictionScreenState();
}

class _OpenPredictionScreenState extends State<OpenPredictionScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var _strokeOrangeWidth = 3.0;
  var _stroke_purpel_Width = 30.0;
  bool isLeft = false;
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
              )),
          SizedBox(height: 20.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPurpelOutlineGradiantLeft(),
                buildPurpelOutlineGradiantRight()
              ],
            ),
          ),
          SizedBox(height: 20.h),
          isLeft == true ? buildGames(size) : buildGamesRight(size)
        ],
      ),
    );
  }

  Container buildGamesRight(Size size) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .50,
      width: size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FlipAnimation(
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 20.w, top: 15.h, bottom: 15.h),
                  child: Card(
                    child: Container(
                      height: size.height * .23,
                      width: size.width * .485,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 5,
                              offset: Offset(5, 5),
                              blurRadius: 2.0,
                              color: AppColors.background_color1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.background_color1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/timer.png"),
                                Text(
                                  "UEFA Champions League",
                                  style: titlegreyStyle,
                                ),
                                Text(
                                  "Thu, Aug 23",
                                  style: titlegreyStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff7D7D7D),
                            height: 3,
                            endIndent: 20,
                            indent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Predict :",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Real Madrid",
                                  style: titlegoldan,
                                ),
                              ],
                            ),
                          ),
                          //league pictures row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/madrid.png",
                                  scale: 1.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/Group 70.png",
                                  // scale: 1.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.h),
                                child: Image.asset(
                                  "assets/images/barca.png",
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    color: AppColors.background_color1,
                  ),
                ))));
          }),
    );
  }

  Container buildGames(Size size) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .50,
      width: size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FlipAnimation(
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 20.w, top: 15.h, bottom: 15.h),
                  child: Card(
                    child: Container(
                      height: size.height * .23,
                      width: size.width * .485,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 5,
                              offset: Offset(5, 5),
                              blurRadius: 2.0,
                              color: AppColors.background_color1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.background_color1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/timer.png"),
                                Text(
                                  "UEFA Champions League",
                                  style: titlegreyStyle,
                                ),
                                Text(
                                  "Thu, Aug 23",
                                  style: titlegreyStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff7D7D7D),
                            height: 3,
                            endIndent: 20,
                            indent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Predict :",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Real Madrid",
                                  style: titlegoldan,
                                ),
                              ],
                            ),
                          ),
                          //league pictures row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/madrid.png",
                                  scale: 1.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  "VS",
                                  style: largetextVSStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.h),
                                child: Image.asset(
                                  "assets/images/barca.png",
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    color: AppColors.background_color1,
                  ),
                ))));
          }),
    );
  }

  OutlineGradientButton buildPurpelOutlineGradiantLeft() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 3.0;
          _stroke_purpel_Width = 30.0;
          isLeft = true;
        });
      },
      child: Container(
        width: 140,
        height: 25,
        child: Container(
          child: Center(
            child: Text(
              'Open Predictions',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0XFFDD7EE0).withOpacity(0.9),
          Color(0XFF8787F2),
        ],
      ),
      strokeWidth: _stroke_purpel_Width,
      //radius: Radius.circular(0.0001),
    );
  }

  OutlineGradientButton buildPurpelOutlineGradiantRight() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 30.0;
          _stroke_purpel_Width = 3.0;
          isLeft = false;
        });
      },
      child: Container(
        width: 140,
        height: 25,
        child: Container(
          child: Center(
            child: Text(
              'Completed Predictions',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0XFF8787F2),
          Color(0XFFDD7EE0).withOpacity(0.9),
        ],
      ),
      strokeWidth: _strokeOrangeWidth,
      // radius: Radius.circular(0.01),
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
