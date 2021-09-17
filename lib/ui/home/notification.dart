import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: size.height,
            color: AppColors.background_color,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appBarWithText(size, context, "Notifications",
                      AppColors.background_color1, () {
                    Navigator.of(context).pop();
                  }),
                  build_notifications(size, context),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget build_notifications(Size size, BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Container(
          height: size.height * 0.97,
          width: size.width,
          child: ListView.builder(
              shrinkWrap: false,
              itemCount: 10,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20.0.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.background_color1),
                          height: 170.h,
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
                                    scale: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: Color(0xFF242A3E),
                                  ),
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // WavyText("Notification $index",
                                      //     Colors.white, 18.sp, FontWeight.w600),
                                      Text(
                                        "Notification $index",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "10:32 - Aug 12, 2021",
                                        style: GoogleFonts.openSans(
                                            textStyle: subtitleStyle1),
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        "Description",
                                        style: smallwhiteStyle,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
}
