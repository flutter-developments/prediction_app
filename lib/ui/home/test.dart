import 'package:flutter/material.dart';
import 'package:prediction_app/ui/language/select_language.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/user_guide/user_guide_4.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_color,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 35.w),
                child: Center(
                    child: Text(
                  "Welcome User!",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w900),
                )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Explore our user guide to know",
                      style: mediumwhiteStyle),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("how to play and make your", style: mediumwhiteStyle),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("predictions", style: mediumwhiteStyle),
                  SizedBox(
                    height: 30.h,
                  ),
                  // Container(
                  //   width: size.width,
                  //   child: Image.asset(
                  //     "assets/images/welcome.png",
                  //     fit: BoxFit.fitWidth,
                  //     scale: 1.1,
                  //   ),
                  // ),
                  RaisedGradientButton(
                    child: Text(
                      "Read User Guide",
                      style: smallwhiteStyle,
                    ),
                    onPressed: () {
                      AppRoutes.push(context, UserGuide4());
                    },
                    height: 50.h,
                    width: 201.w,
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFDD7EE0),
                        Color(0XFF8787F2),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 44.h, right: 20.w, bottom: 30.h),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GradientButton(
                        title: "Skip",
                        onPressed: () {
                          AppRoutes.push(context, MainScreen());
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
