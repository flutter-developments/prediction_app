import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';

class StatsContainer extends StatelessWidget {
  final String title;
  final String stats;

  const StatsContainer({required this.title, required this.stats});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final borderWidth = 1.0;
    final kInnerDecoration = BoxDecoration(
      border: Border.all(
        width: 1,
      ),
      color: AppColors.background_color1,
      borderRadius: BorderRadius.circular(
        20,
      ),
    );
    final kGradientBoxDecoration = BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0XFFD87FE2),
        Color(0XFF8A87F2).withOpacity(0.3),
      ]),
      borderRadius: BorderRadius.circular(20),
    );
    return Container(
      height: size.height * 0.20,
      width: size.width * 0.30,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 1,
              offset: Offset(4.0, 4.0),
              blurRadius: 3.0,
              color: AppColors.background_color1,
            ),
          ],
          color: AppColors.background_color1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                10,
              ),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
              title,
              style: mediumwhiteStyle,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(4.0), //width of the border
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 80.0
                        .w, // this width forces the container to be a circle
                    height: 80.0
                        .h, // this height forces the container to be a circle
                    child: Center(
                      child: Text(stats,
                          style: GoogleFonts.openSans(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor)
                          //textAlign: TextAlign.center,
                          ),
                    ),
                    decoration: kInnerDecoration,
                  ),
                ),
              ),
              decoration: kGradientBoxDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
