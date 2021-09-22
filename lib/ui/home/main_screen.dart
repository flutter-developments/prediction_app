import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:prediction_app/ui/home/exchange_screen1.dart';
import 'package:prediction_app/ui/home/main_screen_2.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'notification.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
            buildSuper_leauge(size),
          ],
        )),
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
                      SizedBox(
                        width: size.width * .01,
                      ),
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

// ignore: non_constant_identifier_names
Widget buildSuper_leauge(Size size) {
  return Container(
    color: AppColors.primery_color,
    height: size.height * .85,
    width: size.width,
    child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
              child: Container(
                decoration: BoxDecoration(

                    //color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(0, 3.0),
                        blurRadius: 12.0,
                        color: AppColors.background_color1,
                      ),
                    ]),
                height: size.height * .27,
                width: size.width * .491,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(sports[index].image,
                            fit: BoxFit.cover)),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(sports[index].title,
                                  style: GoogleFonts.openSans(
                                      color: Colors.white,
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    sports[index].games,
                                    style: GoogleFonts.openSans(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    "Live Championships",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
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
            onTap: () {
              AppRoutes.push(context, MainScreen2());
            },
          );
        }),
  );
}
