import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/open_prediction_screen.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'exchange_screen1.dart';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var _strokeOrangeWidth = 30.0;
  // ignore: non_constant_identifier_names
  var _stroke_purpel_Width = 3.0;
  List goals = [30.0, 3.0, 3.0, 3.0];
  // ignore: unused_field
  List _readCard = [30.0, 3.0, 3.0, 3.0];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: DrawerFull(context, MediaQuery.of(context).size),
        body: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                buildappbarContainer(size, context),
                SizedBox(
                  height: 30.h,
                ),
                buildscreen(size),
                SizedBox(height: 20.h),
                buildTeam(size),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 120.w, vertical: 30.h),
                  child: RaisedGradientButton(
                      width: 120.w,
                      height: 50.h,
                      child: Text(
                        "Set Prediction",
                        style: smallwhiteStyle,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0XFFDD7EE0).withOpacity(0.9),
                          Color(0XFF8787F2),
                        ],
                      ),
                      onPressed: () {
                        AppRoutes.push(context, OpenPredictionScreen());
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Container buildscreen(
    Size size,
  ) {
    return Container(
      height: size.height * .55,
      width: size.width,
      color: AppColors.primery_color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "UEFA Champions League",
            style: mediumextwhiteStyle,
          ),
          SizedBox(height: 10.h),
          Text(
            "Today, Sept 07    22:00",
            style: titlegreyStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Image.asset("assets/images/madrid.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Semi-finals",
                      style: titlegreyStyle,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "VS",
                      style: mediumextwhiteStyle,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Image.asset(
                    "assets/images/barca.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Real Madrid",
                  style: smallwhiteStyle,
                ),
                Text(
                  "Barcalona",
                  style: smallwhiteStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Divider(
            color: Color(0xff7D7D7D),
            height: 2,
            endIndent: 20,
            indent: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: TextFields.normalTextField1(context,
                inputType: TextInputType.number,
                color: Colors.grey,
                hintText: "Enter Credits Amount"),
          ),
          Divider(
            color: Color(0xff7D7D7D),
            height: 2,
            endIndent: 20,
            indent: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new CircularPercentIndicator(
                  startAngle: 180.0,
                  radius: 70.0,
                  animation: true,
                  animationDuration: 1100,
                  lineWidth: 5.0,
                  percent: 0.32,
                  center: new Text(
                    "32.3",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.yellow,
                ),
                Text(
                  "Estimated\nWinnings",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                new CircularPercentIndicator(
                  startAngle: 180.0,
                  radius: 70.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 5.0,
                  percent: 0.52,
                  center: new Text(
                    "52.3",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.yellow,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Normal Member",
                  style: smallwhiteStyle,
                ),
                Text(
                  "Premium Member",
                  style: smallwhiteStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Divider(
            color: Color(0xff7D7D7D),
            height: 2,
            endIndent: 10,
            indent: 10,
          ),
        ],
      ),
    );
  }

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

  Widget buildTeam(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          Card(
            child: Container(
              height: size.height * .18,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 3,
                      offset: Offset(0.0, 0.60),
                      blurRadius: 1.0,
                      color: AppColors.background_color1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background_color1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Text(
                      "Which Team Will Win",
                      style: titlegreyStyle,
                    ),
                  ),
                  //league pictures row
                  //SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildOutlineGradientButton(),
                      buildPurpelOutlineGradiant(),
                    ],
                  ),
                ],
              ),
            ),
            color: AppColors.background_color1,
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: Container(
              height: size.height * .24,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 3,
                      offset: Offset(0.0, 0.60),
                      blurRadius: 1.0,
                      color: AppColors.background_color1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background_color1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Text(
                      "Who will score 2 Goals?",
                      style: titlegreyStyle,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOutline(),
                          buildPurpel(),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOutline1(),
                          buildPurpel1(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            color: AppColors.background_color1,
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: Container(
              height: size.height * .23,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 3,
                      offset: Offset(0.0, 0.60),
                      blurRadius: 1.0,
                      color: AppColors.background_color1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.background_color1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Text(
                      "Who will get a Red Card?",
                      style: titlegreyStyle,
                    ),
                  ),
                  //league pictures row
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOutline(),
                          buildPurpel(),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildOutline1(),
                          buildPurpel1(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            color: AppColors.background_color1,
          ),
        ],
      ),
    );
  }

  OutlineGradientButton buildOutlineGradientButton() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 30.0;
          _stroke_purpel_Width = 3.0;
        });
      },
      child: Container(
        width: 120.w,
        height: 35.h,
        child: Container(
          constraints: BoxConstraints(maxWidth: 140, maxHeight: 37),
          child: Center(
            child: Text(
              'R. Madrid (1.3)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xffBB306A),
          Color(0XFFD28D27),
        ],
      ),
      strokeWidth: _strokeOrangeWidth,
      radius: Radius.circular(30),
    );
  }

  OutlineGradientButton buildPurpelOutlineGradiant() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 3.0;
          _stroke_purpel_Width = 30.0;
        });
      },
      child: Container(
        width: 120.w,
        height: 35.w,
        child: Container(
          child: Center(
            child: Text(
              'Barca (0.87)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff0AA46C),
          Color(0XFF3BA2DC),
        ],
      ),
      strokeWidth: _stroke_purpel_Width,
      radius: Radius.circular(30),
    );
  }

  OutlineGradientButton buildOutline1() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          goals = [30.0, 3.0, 3.0, 3.0];
        });
      },
      child: Container(
        width: 120.w,
        height: 35.h,
        child: Container(
          constraints: BoxConstraints(maxWidth: 140, maxHeight: 37),
          child: Center(
            child: Text(
              'Ronaldo(1.3)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xffBB306A),
          Color(0XFFD28D27),
        ],
      ),
      strokeWidth: goals[0],
      radius: Radius.circular(30),
    );
  }

  OutlineGradientButton buildPurpel1() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          goals = [3.0, 30.0, 3.0, 3.0];
        });
      },
      child: Container(
        width: 120.w,
        height: 35.h,
        child: Container(
          child: Center(
            child: Text(
              'Messi (0.87)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff0AA46C),
          Color(0XFF3BA2DC),
        ],
      ),
      strokeWidth: goals[1],
      radius: Radius.circular(30),
    );
  }

  OutlineGradientButton buildOutline() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          goals = [3.0, 3.0, 30.0, 3.0];
        });
      },
      child: Container(
        width: 120.w,
        height: 35.h,
        child: Container(
          constraints: BoxConstraints(maxWidth: 140, maxHeight: 37),
          child: Center(
            child: Text(
              'Ronaldo(1.3)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xffBB306A),
          Color(0XFFD28D27),
        ],
      ),
      strokeWidth: goals[2],
      radius: Radius.circular(30),
    );
  }

  OutlineGradientButton buildPurpel() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          goals = [3.0, 3.0, 3.0, 30.0];
        });
      },
      child: Container(
        width: 120.w,
        height: 35.h,
        child: Container(
          child: Center(
            child: Text(
              'Messi (0.87)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff0AA46C),
          Color(0XFF3BA2DC),
        ],
      ),
      strokeWidth: goals[3],
      radius: Radius.circular(30),
    );
  }
}
