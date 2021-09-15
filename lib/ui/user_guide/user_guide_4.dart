import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/ui/user_guide/user_guide1.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';

class UserGuide4 extends StatefulWidget {
  @override
  _UserGuide4State createState() => _UserGuide4State();
}

class _UserGuide4State extends State<UserGuide4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              buildApp_only_title_bar(size, context, "How To Play",AppColors.background_color),
              //build_userGuide(size),
              GuideContainer(
                  title:
                      "Select any sport category  to view the live\nchampionships ",
                  onPressed: () {
                    AppRoutes.push(context, UserGuide());
                  },
                  buttonText: "Next",
                  link: "assets/images/how_to_play_3.png")
            ],
          )),
    );
  }
}
