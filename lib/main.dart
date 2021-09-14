import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/welcome/welcome.dart';

void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
          theme: ThemeData(fontFamily: "Raleway"),
          debugShowCheckedModeBanner: false,
          home: MainScreen()),
      designSize: Size(414, 896),
    );
  }
}
