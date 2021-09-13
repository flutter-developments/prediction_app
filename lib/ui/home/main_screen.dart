import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            color: AppColors.primery_color,
            child: ListView(
              children: [
                buildApp_bar(size, context),
                SizedBox(
                  height: 20.h,
                ),
                buildSuper_leauge(size),
              ],
            )),
      ),
    );
  }

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
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(notifications[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: new BackdropFilter(
                        //   filter: new ImageFilter.blur(
                        //       sigmaX: 600.0, sigmaY: 600.0),
                        //   child: new Container(
                        //     decoration:
                        //         new BoxDecoration(color: Colors.transparent),
                        //   ),
                        // ),
                      ),

                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                        ),
                      ),
                      //),
                      Positioned(
                        top: 90.0.h,
                        right: 69.0.w,
                        left: 69.0.w,
                        child: Center(
                          child: Text(
                            notifications[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150.h,
                        right: 69.0.w,
                        left: 69.0.w,
                        child: Center(
                          child: Text(
                            notifications[index].time.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
