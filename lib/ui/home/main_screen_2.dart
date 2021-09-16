import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

import 'exchange_history.dart';
import 'notification.dart';

class MainScreen2 extends StatefulWidget {
  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        key: _key,
        drawer: DrawerFull(context, MediaQuery.of(context).size),
        // appBar: AppBar(
        //   title: Text("title"),
        // ),
        body: Container(
            child: ListView(
          children: [
            buildContainer(size, context),
            SizedBox(
              height: 30.h,
            ),
            buildSuper_leauge(size),
          ],
        )),
      ),
    );
  }

  Container buildContainer(Size size, BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => _key.currentState!.openDrawer(),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/pic 2.png",
                      scale: 1.4,
                    ),
                  ),
                ),
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
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "1000",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Image.asset("assets/images/Group.png")
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/Group 20.png"),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Text(
                      "Get Credit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      AppRoutes.push(context, Notifications());
                    },
                    child:
                        Image.asset("assets/images/appbar_notification.png")),
                GestureDetector(
                    onTap: () {
                      AppRoutes.push(context, ExchangeHistory());
                    },
                    child: Image.asset("assets/images/Group 24.png"))
              ],
            )
          ],
        ),
      )),
    );
  }
//main body card
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
                      Image.asset(notifications[index].image,
                          fit: BoxFit.cover),
                      ClipRRect(
                        // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ScaleText(notifications[index].title,
                                    Colors.white, 23.sp, FontWeight.bold),
                                //   style: TextStyle(
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w700,
                                //       color: Colors.white),
                                // ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  notifications[index].time.toString(),
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
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
