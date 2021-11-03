import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/model/response_model/notification_model.dart';
import 'package:prediction_app/provider/paymnet_provider.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isFetched = false;
  NotificationsModel? notify;
  @override
  void initState() {
    super.initState();
    _getNotifications();
  }

  _getNotifications() {
    Provider.of<PaymnetProvider>(context, listen: false)
        .getNotification()
        .then((value) {
      print(value!.message.toString());
      if (value.success == true) {
        setState(() {
          notify = value;
          _updateState(true);
        });
      }
    });
  }

  // ignore: unused_element
  _updateState(bool isValue) {
    isFetched = isValue;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.background_color,
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBarWithText(MediaQuery.of(context).size, context,
                    "Notifications", AppColors.background_color1, () {
                  Navigator.of(context).pop();
                }),
                build_notifications(MediaQuery.of(context).size, context),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget build_notifications(Size size, BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: isFetched
          ? Container(
              height: size.height * 0.97,
              width: size.width,
              child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: notify!.data.length,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // WavyText("Notification $index",
                                          //     Colors.white, 18.sp, FontWeight.w600),
                                          Text(
                                            "${notify!.data[index].title} ${notify!.data[index].id}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            notify!.data[index].createdAt
                                                .toString(),
                                            style: GoogleFonts.openSans(
                                                textStyle: subtitleStyle1),
                                          ),
                                          SizedBox(height: 20.h),
                                          Text(
                                            notify!.data[index].message,
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
            )
          : Container(
              child: Center(
              child: CircularProgressIndicator(),
            )));
}
