import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/auth/login.dart';


void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
          theme: ThemeData(fontFamily: "Raleway"),
          debugShowCheckedModeBanner: false,
          home: Auth()),
      designSize: Size(414, 896),
    );
  }
}
