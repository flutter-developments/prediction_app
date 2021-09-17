import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';
import 'package:prediction_app/utils/app_colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();

    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Welcome()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background_color1,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
        children: [
          
          Center(
              child:Image.asset("assets/images/logo.png") ),
          SizedBox(
            height: 20.h,
          ),
          SpinKitFadingCube(
            color:Colors.white,
            size: 50.0.sp,
          ),
         
        ],
          ),
        ));
  }
}
