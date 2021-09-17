// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:prediction_app/Widgets/Gradient_btn.dart';
// import 'package:prediction_app/Widgets/appBar.dart';
// import 'package:prediction_app/ui/user_guide/user_guide3.dart';
// import 'package:prediction_app/utils/app_colors.dart';
// import 'package:prediction_app/utils/routes.dart';

// class UserGuide2 extends StatefulWidget {
//   @override
//   _UserGuide2State createState() => _UserGuide2State();
// }

// class _UserGuide2State extends State<UserGuide2> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//           color: AppColors.background_color,
//           child: Column(
//             children: [
//               buildApp_only_title_bar(size, context, "How To Play"),
//               build_userGuide(size),
//             ],
//           )),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   build_userGuide(Size size) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//           height: size.height * .87,
//           width: size.width,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.bar_color),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Image.asset(
//                   "assets/images/how_to_play1.png",
//                   scale: 1.1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Select any upcoming game to make your predictions",
//                   style: TextStyle(color: Colors.white, fontSize: 14),
//                 ),
//               ),
//               UnicornOutlineButton(
//                 strokeWidth: 2,
//                 radius: 24,
//                 gradient: LinearGradient(
//                     colors: [Color(0xFFD87FE2), Color(0xFF8987F2)]),
//                 child: Text('Next',
//                     style: TextStyle(color: Colors.white, fontSize: 15)),
//                 onPressed: () {
//                   AppRoutes.push(context, UserGuide3());
//                 },
//               ),
//             ],
//           )),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/guide_container.dart';
import 'package:prediction_app/ui/user_guide/user_guide3.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';

class UserGuide2 extends StatefulWidget {
  @override
  _UserGuide2State createState() => _UserGuide2State();
}

class _UserGuide2State extends State<UserGuide2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          color: AppColors.background_color,
          child: ListView(
            children: [
              appBarWithText(size, context, "How To Play", AppColors.background_color,
                    () {
                  Navigator.of(context).pop();
                }),
              GuideContainer(
                  title:
                      "Select any upcoming game to make\nyour predictions",
                  onPressed: () {
                    AppRoutes.push(context, UserGuide3());
                  },
                  buttonText: "NEXT",
                  link: "assets/images/how_to_play1.png")
              //build_userGuide(size),
            ],
          )),
    );
  }

//   // ignore: non_constant_identifier_names
//   build_userGuide(Size size) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//       child: Expanded(
//         child: Container(
//           width: size.width,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.background_color1),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                     top: 20.0.h, left: 15.w, right: 15.w, bottom: 30.h),
//                 child: Image.asset(
//                   "assets/images/how_to_play1.png",
//                   scale: 1.1,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   "Select any upcoming game to make\nyour predictions",
//                   textAlign: TextAlign.center,
//                   style: largeFontStyle,
//                 ),
//               ),
//               SizedBox(
//                 height: 15.h,
//               ),
//               GradientButton(
//                 title: 'NEXT',
//                 onPressed: () {
//                   AppRoutes.replace(context, UserGuide3());
//                 },
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
 }
