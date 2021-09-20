import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/withdraw_email.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

class ExchangeScreen1 extends StatefulWidget {
  @override
  _ExchangeScreen1State createState() => _ExchangeScreen1State();
}

class _ExchangeScreen1State extends State<ExchangeScreen1> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: AppColors.background_color,
            child: ListView(
              children: [
                buildappbarContainer(size, context),
                SizedBox(height: 50.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    buildColumn(size, "Google PlayStore", "\u0024 15.00 ", () {
                   AppRoutes.push(context, WithDrawEmail());
                    },
                      "assets/images/playstore.png"),
                      buildColumn(size, "Apple App Store", "\u0024 15.00 ", () {
                       AppRoutes.push(context, WithDrawEmail());
                      },
                      "assets/images/apple.png")
                  ],),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    buildColumn(size, "PayPal", "\u0024 15.00 ", () {
                   AppRoutes.push(context, WithDrawEmail());
                    },
                      "assets/images/paypal.png"),
                      buildColumn(size, "MasterCard", "\u0024 15.00 ", () {
                       AppRoutes.push(context, WithDrawEmail());
                      },
                      "assets/images/master.png")
                  ],),
                ),
                SizedBox(height:40.h)
                
              ],
            )),
      ),
    );
  }

  Column buildColumn(Size size, String title, String subtitle,
      VoidCallback onPressed, String link) {
    return Column(
      children: [
        Container(
          height: size.height * 0.20,
          width: size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.background_color1,
          ),
          child: Center(child: Image.asset(link)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            
            title,
            textAlign: TextAlign.start,
            style: GoogleFonts.openSans(fontSize:18.sp,fontWeight: FontWeight.w700,color:AppColors.white)
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(subtitle,style:TextStyle(fontSize:18.sp,fontWeight: FontWeight.w700,color:AppColors.goldenColor),),
          Text("(Conversion Rate)",style: GoogleFonts.openSans(fontSize:13.sp,fontWeight: FontWeight.w700,color:AppColors.goldenColor),),
        ],),
        SizedBox(height:10.h),
        RaisedGradientButton(
            width: 120,
            height: 30,
            child: Text(
              "Exchange",
              style: mediumwhiteStyle,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0XFFDD7EE0).withOpacity(0.9),
                        Color(0XFF8787F2).withOpacity(0.9),
              ],
            ),
            onPressed: () {
           AppRoutes.push(context, WithDrawEmail());
            }),
      ],
    );
  }

  //appbar
  Container buildappbarContainer(Size size, BuildContext context) {
    return Container(
      height: size.height * .150,
      width: size.width,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 10,
              offset: Offset(7.0, 7.0),
              blurRadius: 10.0,
              color: AppColors.background_color1,
            ),
          ],
          color: AppColors.primery_color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/pic 2.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "1000",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Image.asset("assets/images/Group.png"),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, Notifications());
                      },
                      child:
                          Image.asset("assets/images/appbar_notification.png")),
                ],
              ),
            ),
            //second row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, HomeScreen());
                      },
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 20.sp,
                        onPressed: () {
                          AppRoutes.pop(context);
                        },
                      )),
                  Row(
                    children: [
                      Image.asset("assets/images/Group 20.png"),
                      SizedBox(
                        width: size.width * .03,
                      ),
                      Text(
                        "Get Credit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AppRoutes.push(context, ExchangeScreen1());
                      },
                      child: Image.asset("assets/images/Group 24.png"))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
