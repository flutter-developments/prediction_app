// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prediction_app/Widgets/appBar.dart';
// import 'package:prediction_app/utils/app_colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:prediction_app/utils/app_text_styles.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class ExchangeScreen extends StatefulWidget {
//   @override
//   _ExchangeScreenState createState() => _ExchangeScreenState();
// }

// class _ExchangeScreenState extends State<ExchangeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//             color: AppColors.background_color,
//             child: ListView(
//               children: [
//                 buildApp_bar(size, context),
//                 build_notifications(size),
//               ],
//             )),
//       ),
//     );
//   }

//   build_notifications(Size size) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
//       child: Container(
//         height: size.height * .97,
//         width: size.width,
//       ),
//     );
//   }
// }
