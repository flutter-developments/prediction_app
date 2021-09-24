import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:prediction_app/ui/welcome/entry_page.dart';

void main() => runApp(MyApp());
void configLoading() {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>
          MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
      designSize: Size(414, 896),
    );
  }
}
