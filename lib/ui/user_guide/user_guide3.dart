import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/home/main_screen_2.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuide3 extends StatefulWidget {
  @override
  _UserGuide3State createState() => _UserGuide3State();
}

class _UserGuide3State extends State<UserGuide3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              buildApp_only_title_bar(
                  size, context, "How To Play", AppColors.background_color),
              //build_userGuide(size),
              GuideContainer(
                  title:
                      "Enter your Credits to make different\npredictions and choose between different\noptions",
                  onPressed: () {
                    AppRoutes.push(context, MainScreen());
                  },
                  buttonText: "Play",
                  link: "assets/images/Match Screen 1.png")
            ],
          )),
    );
  }
}
