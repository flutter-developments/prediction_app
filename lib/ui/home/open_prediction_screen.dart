import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/Widgets/custom_appbar.dart';
import 'package:prediction_app/model/response_model/userDetailModel.dart';
import 'package:prediction_app/provider/user_detail_provider.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'exchange_screen1.dart';

class OpenPredictionScreen extends StatefulWidget {
  @override
  _OpenPredictionScreenState createState() => _OpenPredictionScreenState();
}

class _OpenPredictionScreenState extends State<OpenPredictionScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late UserDetailProvider userDetailProvider;
  UserDetailModel? userDetailModel;
  bool isFetched = false;
  void initState() {
    _getUserDetail();
    super.initState();
    // _getUserDetail();
  }

  void _getUserDetail() async{
    await Provider.of<UserDetailProvider>(context, listen: false)
        .getUserDetail()
        .then((value) {
          print('user data in widget class ${value.data.winRate}');
      setState(() {
         print(value.toString());
        // print(value.message.toString());
        if (value.success == true) {
          _updateState(true);
          userDetailModel = value;
          print(userDetailModel?.data.winRate);

        }
      });
    });
  }

  // ignore: unused_element
  _updateState(bool isValue) {
    setState(() {
      isFetched = isValue;
    });
  }
  // UserDetailProvider _userDetailProvider = UserDetailProvider();
  // UserDetailModel _userDetailModel;
  var _strokeOrangeWidth = 3.0;
  // ignore: non_constant_identifier_names
  var _stroke_purpel_Width = 30.0;
  bool isLeft = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // userDetailProvider = Provider.of<UserDetailProvider>(context);
    // _userDetailModel = await _userDetailProvider.getUserDetail();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primery_color,
        key: _key,
        drawer: DrawerFull(context, MediaQuery.of(context).size),
        body:
        // isFetched?Center(child: CircularProgressIndicator()):
        Container(
            child: ListView(
          children: [
            buildappbarContainer(size, context),
            SizedBox(
              height: 30.h,
            ),
            buildpredictionScreen(size),
          ],
        )),
      ),
    );
  }

  Container buildpredictionScreen(
    Size size,
  ) {
    return Container(
      height: size.height * .85,
      width: size.width,
      color: AppColors.primery_color,
      child: Column(
        children: [
          Container(
              height: size.height * .18,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatsContainer(title: "Predictions", stats: '${userDetailModel?.data.totalPrediction}'),
                    StatsContainer(title: "Wins", stats: '${userDetailModel?.data.winPrediction}'),
                    StatsContainer(title: "Win rate", stats: '${userDetailModel?.data.winRate}%'),
                  ],
                ),
              )),
          SizedBox(height: 40.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPurpelOutlineGradiantLeft(),
                buildPurpelOutlineGradiantRight()
              ],
            ),
          ),
          SizedBox(height: 20.h),
          isLeft == true ? buildGames(size) : buildGamesRight(size)
        ],
      ),
    );
  }

  Container buildGamesRight(Size size) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .50,
      width: size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FlipAnimation(
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 15.w, top: 20.h, bottom: 15.h),
                  child: Card(
                    child: Container(
                      height: size.height * .25,
                      width: size.width * .485,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 3,
                              offset: Offset(0.0, 0.60),
                              blurRadius: 1.0,
                              color: AppColors.background_color1,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/Vector grey.png"),
                                Text(
                                  "UEFA Champions League",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Thu, Aug 23",
                                  style: titlegreyStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff7D7D7D),
                            height: 3,
                            endIndent: 10,
                            indent: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Predict :",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Real Madrid",
                                  style: titlegoldan,
                                ),
                              ],
                            ),
                          ),
                          //league pictures row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/madrid.png",
                                  scale: 1.4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/Group 70.png",
                                  // scale: 1.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.h),
                                child: Image.asset(
                                  "assets/images/barca.png",
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    color: AppColors.background_color1,
                  ),
                ))));
          }),
    );
  }

  Container buildGames(Size size) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .50,
      width: size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FlipAnimation(
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 15.w, top: 20.h, bottom: 15.h),
                  child: Card(
                    child: Container(
                      height: size.height * .25,
                      width: size.width * .485,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 3,
                              offset: Offset(0.0, 0.60),
                              blurRadius: 1.0,
                              color: AppColors.background_color1,
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/images/timer.png"),
                                Text(
                                  "UEFA Champions League",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Thu, Aug 23",
                                  style: titlegreyStyle,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff7D7D7D),
                            height: 3,
                            endIndent: 10,
                            indent: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Predict :",
                                  style: titlegreyStyle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Real Madrid",
                                  style: titlegoldan,
                                ),
                              ],
                            ),
                          ),
                          //league pictures row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                  10.w,
                                ),
                                child: Image.asset(
                                  "assets/images/madrid.png",
                                  scale: 1.4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  "VS",
                                  style: largetextVSStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.h),
                                child: Image.asset(
                                  "assets/images/barca.png",
                                  scale: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    color: AppColors.background_color1,
                  ),
                ))));
          }),
    );
  }

  OutlineGradientButton buildPurpelOutlineGradiantLeft() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 3.0;
          _stroke_purpel_Width = 30.0;
          isLeft = true;
        });
      },
      child: Container(
        width: 140.w,
        height: 35.h,
        child: Container(
          child: Center(
            child: Text(
              'Open Predictions',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0XFFDD7EE0).withOpacity(0.9),
          Color(0XFF8787F2),
        ],
      ),
      strokeWidth: _stroke_purpel_Width,
      //radius: Radius.circular(0.0001),
    );
  }

  OutlineGradientButton buildPurpelOutlineGradiantRight() {
    return OutlineGradientButton(
      onTap: () {
        setState(() {
          _strokeOrangeWidth = 30.0;
          _stroke_purpel_Width = 3.0;
          isLeft = false;
        });
      },
      child: Container(
        width: 140.w,
        height: 35.h,
        child: Container(
          child: Center(
            child: Text(
              'Completed Predictions',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
      gradient: LinearGradient(
        colors: [
          Color(0XFF8787F2),
          Color(0XFFDD7EE0).withOpacity(0.9),
        ],
      ),
      strokeWidth: _strokeOrangeWidth,
      // radius: Radius.circular(0.01),
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
                      SizedBox(
                        width: size.width * .01,
                      ),
                      Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.goldenColor)),
                        child: Image.asset("assets/images/colon.png"),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        AppRoutes.push(context, Notifications());
                      },
                      icon: Icon(
                        Icons.notification_add_outlined,
                        color: AppColors.white,
                        size: 35.sp,
                      ))
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
                      CircleAvatar(
                        maxRadius: 17,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFDD7EE0),
                                Color(0xFF8787F2),
                                Color(0xFFDD7EE0),
                              ],
                            ),
                          ),
                          child: IconButton(
                              alignment: Alignment.topCenter,
                              iconSize: 19.sp,
                              onPressed: () {
                               
                              },
                              icon: Icon(
                                Icons.add,
                                color: AppColors.white,
                              )),
                        ),
                      ),
                      //Image.asset("assets/images/icon1.png"),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        "Get Credit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: CircleAvatar(
                      backgroundColor: AppColors.goldenColor,
                      maxRadius: 17.sp,
                      child: IconButton(
                          alignment: Alignment.topCenter,
                          iconSize: 20.sp,
                          onPressed: () {
                            AppRoutes.push(context, ExchangeScreen1());
                          },
                          icon: Icon(
                            Icons.attach_money,
                            color: AppColors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
