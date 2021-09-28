import 'package:flutter/material.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/user_guide/user_guide_4.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'Gradient_btn.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 35),
                child: Center(
                    child: Text(
                  "Welcome User!",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Explore our user guide to know",
                      style: mediumwhiteStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("how to play and make your", style: mediumwhiteStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("predictions", style: mediumwhiteStyle),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedGradientButton(
                    child: Text(
                      "Read User Guide",
                      style: smallwhiteStyle,
                    ),
                    onPressed: () {
                      AppRoutes.push(context, UserGuide4());
                    },
                    height: 50,
                    width: 201,
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFDD7EE0),
                        Color(0XFF8787F2),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 44, right: 20, bottom: 30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GradientButton(
                        title: "Skip",
                        onPressed: () {
                          // AppRoutes.push(context, MainScreen());
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
