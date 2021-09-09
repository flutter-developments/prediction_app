import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/ui/user_guide/user_guide2.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';

class UserGuide extends StatefulWidget {
  @override
  _UserGuideState createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: Column(
            children: [
              buildApp_only_title_bar(size, context, "How To Play"),
              build_userGuide(size),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  build_userGuide(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: size.height * .87,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bar_color),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  "assets/images/how_to_play.png",
                  scale: 1.1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select any ongoing league or event to view the games and making a prediction",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              UnicornOutlineButton(
                strokeWidth: 2,
                radius: 24,
                gradient: LinearGradient(
                    colors: [Color(0xFFD87FE2), Color(0xFF8987F2)]),
                child: Text('Next',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                onPressed: () {
                  AppRoutes.push(context, UserGuide2());
                },
              ),
            ],
          )),
    );
  }
}
