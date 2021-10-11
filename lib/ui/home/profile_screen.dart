import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/appBar.dart';
import 'package:prediction_app/Widgets/profile_widget.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background_color1,
      body: SafeArea(
          child: Center(
        child: ListView(
          children: [
            appBarWithText(MediaQuery.of(context).size, context, "",
                AppColors.background_color1, () {
              Navigator.of(context).pop();
            }),
            GestureDetector(
              onTap: () => {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/pic 2.png"),
                maxRadius: 100,
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "User ABCD",
              style: mediumextwhiteStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: size.width * 0.05),
                Text(
                  "1000",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //   width: size.width * .01,
                // ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.monetization_on_outlined,
                      color: AppColors.goldenColor,
                      size: 20.sp,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new CircularPercentIndicator(
                    startAngle: 180.0,
                    radius: 70.0,
                    animation: true,
                    animationDuration: 1100,
                    lineWidth: 5.0,
                    percent: 0.32,
                    center: new Text(
                      "32.3",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.white,
                    progressColor: Color(0xffDD7EE0),
                  ),
                  new CircularPercentIndicator(
                    startAngle: 180.0,
                    radius: 70.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 5.0,
                    percent: 0.52,
                    center: new Text(
                      "52.3",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.white,
                    progressColor: Color(0xffDD7EE0),
                  ),
                  new CircularPercentIndicator(
                    startAngle: 180.0,
                    radius: 70.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 5.0,
                    percent: 0.06,
                    center: new Text(
                      "0.6",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.white,
                    progressColor: Color(0xffDD7EE0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Open\nPredictions",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Completed\nPredictions",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Open\nTransactions",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "123456@gmail.com",
                    style: titlegreyStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "+923665448815",
                    style: titlegreyStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 20.h),
              child: GradientButton(
                title: "Password Reset",
                onPressed: () {},
              ),
            ),
          ],
        ),
      )),
    );
  }
}
