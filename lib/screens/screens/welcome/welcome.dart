import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppColors.background_color,
      body: SafeArea(
        child: Center(
          child: ListView(
              // children: <Widget>[
              //   Padding(
              //     padding: EdgeInsets.only(top: 50.h, bottom: 35.w),
              //     child: Center(
              //         child: Text(
              //       "Welcome User!",
              //      /
              //     )),
              //   ),
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Text("Explore our user guide to know",
              //           style: mediumwhiteStyle),
              //       SizedBox(
              //         height: 5.h,
              //       ),
              //       Text("how to play and make your", style: mediumwhiteStyle),
              //       SizedBox(
              //         height: 5.h,
              //       ),
              //       Text("predictions", style: mediumwhiteStyle),
              //       SizedBox(
              //         height: 30.h,
              //       ),
              //       Container(
              //         width: size.width,
              //         child: Image.asset(
              //           "assets/images/welcome.png",
              //           fit: BoxFit.fitWidth,
              //           scale: 1.1,
              //         ),
              //       ),
              //       RaisedGradientButton(
              //         child: Text(
              //           "Read User Guide",
              //           style: smallwhiteStyle,
              //         ),
              //         onPressed: () {
              //           AppRoutes.push(context, UserGuide4());
              //         },
              //         height: 50.h,
              //         width: 201.w,
              //         gradient: LinearGradient(
              //           colors: [
              //             Color(0XFFDD7EE0),
              //             Color(0XFF8787F2),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding:
              //             EdgeInsets.only(top: 44.h, right: 20.w, bottom: 30.h),
              //         child: Align(
              //           alignment: Alignment.bottomRight,
              //           child: GradientButton(
              //             title: "Skip",
              //             onPressed: () {
              //               AppRoutes.push(context, MainScreen());
              //             },
              //           ),
              //         ),
              //       )

              //     ],
              //   ),
              // ],
              ),
        ),
      ),
    );
  }
}
