import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/custom_appbar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'exchange_history.dart';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
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
              buildscreen(size),
          ],
        )),
      ),
    );
  }


  Container buildscreen(
    Size size,
  ) {
    return Container(
      height: size.height * .85,
      width: size.width,
      color: AppColors.primery_color,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Image.asset("assets/images/madrid.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Column(
                    children: [
                      Text(
                        "Semi-finals",
                        style: titlegreyStyle,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "VS",
                        style: mediumextwhiteStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Image.asset(
                    "assets/images/barca.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Real Madrid",
                  style: mediumwhiteStyle,
                ),
                Text(
                  "Barcalona",
                  style: mediumwhiteStyle,
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
            child: TextFields.normalTextField(context,
                color: Colors.grey, hintText: "Enter Credits Amount"),
          ),
          Divider(
            color: Color(0xff7D7D7D),
            height: 2,
            endIndent: 20,
            indent: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new CircularPercentIndicator(
                  startAngle: 180.0,
                  radius: 80.0,
                  animation: true,
                  animationDuration: 1200,
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
                      fontSize: 20.0),
                ),
                new CircularPercentIndicator(
                  startAngle: 180.0,
                  radius: 80.0,
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
                  style: mediumwhiteStyle,
                ),
                Text(
                  "Premium Member",
                  style: mediumwhiteStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Divider(
            color: Color(0xff7D7D7D),
            height: 2,
            endIndent: 20,
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

// }
//     UnicornOutlineButton(
//               strokeWidth: 2,
//               radius: 24,
//               gradient: LinearGradient(
//                 colors: [AppColors.gradiantColor1, AppColors.gradiantColor2],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                       constraints:
//                           BoxConstraints(minWidth: 210.w, minHeight: 50),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25.0),
//                           bottomLeft: Radius.circular(25.0),
//                         ),
//                       ),
//                       child: Center(
//                           child: Text('OMG', style: TextStyle(fontSize: 16)))),
//                   Container(
//                       constraints:
//                           BoxConstraints(minWidth: 200.w, minHeight: 50),
//                       decoration: BoxDecoration(
//                         color: Colors.pink,
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20.0),
//                           bottomRight: Radius.circular(20.0),
//                         ),
//                       ),
//                       child: Center(
//                           child: Text('OMG', style: TextStyle(fontSize: 16)))),
//                   // Text('OMG', style: TextStyle(fontSize: 16)),
//                 ],
//               ),
//               onPressed: () {},
//             ),
  OutlineGradientButton buildOutlineGradientButton() {
    return OutlineGradientButton(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 50),
        height: 50,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradiantColor1, AppColors.gradiantColor2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 150, maxHeight: 50),
              height: 50,
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.gradiantColor1, AppColors.gradiantColor2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: Text('Enter further widgets here'),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 150, maxHeight: 50),
              height: 50,
              // alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.primery_color),
              child: Center(
                child: Text('Enter further widgets here'),
              ),
            ),
          ],
        ),
      ),
      gradient: LinearGradient(
        colors: [AppColors.gradiantColor1, AppColors.gradiantColor2],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      strokeWidth: 10.5,
      radius: Radius.circular(10),
    );
  }
}
