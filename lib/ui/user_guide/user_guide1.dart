import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/ui/user_guide/user_guide2.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide extends StatefulWidget {
  @override
  _UserGuideState createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          color: AppColors.background_color,
          child: ListView(
            children: [
              buildApp_only_title_bar(size, context, "How To Play",AppColors.background_color),
              //build_userGuide(size),
              GuideContainer(
                  title:
                      "  Select any ongoing league or event to\nview the games and making a prediction",
                  onPressed: () {
                    AppRoutes.push(context, UserGuide2());
                  },
                  buttonText: "NEXT",
                  link: "assets/images/how_to_play.png")
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  // build_userGuide(Size size) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
  //     child: Expanded(
  //       child: Container(
  //         width: size.width,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: AppColors.background_color1),
  //         child: Column(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(
  //                   top: 20.0.h, left: 15.w, right: 15.w, bottom: 30.h),
  //               child: Image.asset(
  //                 "assets/images/how_to_play.png",
  //                 scale: 1.1,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Text(
  //                 "  Select any ongoing league or event to\nview the games and making a prediction",
  //                 style: largeFontStyle,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15.h,
  //             ),
  //             GradientButton(
  //               title: 'NEXT',
  //               onPressed: () {
  //                 AppRoutes.replace(context, UserGuide2());
  //               },
  //             ),
  //             SizedBox(
  //               height: 20.h,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
