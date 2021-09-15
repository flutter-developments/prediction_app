import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/textField.dart';
import 'package:prediction_app/utils/app_colors.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isSignup = true;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background_color,
          child: ListView(
            children: [
              buildApp_only_title_bar(
                  size, context, "Notifications", AppColors.background_color),
              SizedBox(height: 10),
              Container(
                  color: AppColors.bar_color, child: buildTransection(size)),
              isSignup == true
                  ? Container(
                      height: size.height * .2,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: AppColors.bar_color),
                      child: Column(
                        children: [
                          // TextFields.normalTextField(context,
                          //     color: Colors.white,
                          //     hintText: "Email Address",
                          //     icon: Icons.person),
                          TextFields.normalTextField(context,
                              color: Colors.white,
                              hintText: "Email Address",
                              icon: Icons.email),
                          Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: size.height * .2,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: AppColors.bar_color),
                      child: Center(
                        child: Text(
                          "SignIn",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
            ],
          )),
    );
  }

  Container buildTransection(Size size) {
    return Container(
      height: size.height * .06,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.9],
          colors: [AppColors.background_color, AppColors.bar_color],
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSignup = true;
              });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == true
                      ? BorderRadius.only(
                          topRight: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        ),
                  color: isSignup == true
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "SignUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSignup = false;
              });
            },
            child: Container(
              height: size.height * .06,
              width: size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: isSignup == false
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                        )
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                        ),
                  color: isSignup == false
                      ? AppColors.bar_color
                      : AppColors.background_color),
              child: Center(
                child: Text(
                  "SignIn",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
