import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              buildApp_only_title_bar(
                  size, context, "Notifications", AppColors.background_color1),
              build_notifications(size),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  build_notifications(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
      child: Container(
        height: size.height * .87,
        width: size.width,
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.background_color),
                  height: size.height * .190,
                  width: size.width * .491,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: AppColors.background_color1),
                          child: Image.asset(
                            "assets/images/notification.png",
                            scale: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: AppColors.exchange_card__color,
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Notification $index",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.w),
                                child: Text(
                                  "10:32 - Aug 12, 2021",
                                  style: GoogleFonts.openSans(
                                      textStyle: subtitleStyle1),
                                ),
                              ),
                              Text(
                                "Description",
                                style: smallwhiteStyle,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
