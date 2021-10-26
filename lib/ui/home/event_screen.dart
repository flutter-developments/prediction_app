import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/Gradient_btn.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/api/prodection_api.dart';
import 'package:prediction_app/model/champian_ship_byID.dart';
import 'package:prediction_app/provider/championship_provider.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/ui/home/prediction_screen.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'exchange_screen1.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late ChampionShipProvider championShipProvider;
  late ChampionshipById csbyid;
  bool isFetched = false;
  void initState() {
    super.initState();
    _getChampianShipByID();
  }

  void _getChampianShipByID() {
    Provider.of<ChampionShipProvider>(context, listen: false)
        .getGamesByChampionshipID()
        .then((value) {
      setState(() {
        print(value!.message.toString());
        print(value.message.toString());
        if (value.success == true) {
          _updateState(true);
          csbyid = value;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    championShipProvider = Provider.of<ChampionShipProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.primery_color,
          key: _key,
          drawer: DrawerFull(context, MediaQuery.of(context).size),
          // appBar: AppBar(
          //   title: Text("title"),
          // ),
          body: isFetched
              ? Container(
                  child: ListView(
                  children: [
                    buildappbarContainer(size, context),
                    SizedBox(
                      height: 30.h,
                    ),
                    buildGames(size),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ))
              : Center(child: CircularProgressIndicator())),
    );
  }

  Container buildGames(Size size) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .85,
      width: size.width,
      child: ListView.builder(
          itemCount: csbyid.data.games.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FlipAnimation(
                    // verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.w, right: 20.w, top: 15.h, bottom: 15.h),
                  child: Card(
                    child: Container(
                      height: size.height * .28,
                      width: size.width * .485,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 5,
                              offset: Offset(5, 5),
                              blurRadius: 2.0,
                              color: AppColors.background_color1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.background_color1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "UEFA Champions League",
                            style: titlegreyStyle,
                          ),
                          //league pictures row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Image.network(
                                    "${API_URLS.CHAMPIANLEADTEAMIMAGE_API}/${csbyid.data.games[index].team1Logo}"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Text(
                                  "VS",
                                  style: largetextwhiteStyle,
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, right: 10.w),
                                  child: Image.network(
                                      "${API_URLS.CHAMPIANLEADTEAMIMAGE_API}/${csbyid.data.games[index].team2Logo}")),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  csbyid.data.games[index].team1Name,
                                  style: mediumwhiteStyle,
                                ),
                                RaisedGradientButton(
                                    width: 120.w,
                                    height: 40.h,
                                    child: Text(
                                      "Predict Now",
                                      style: smallwhiteStyle,
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffBB306A),
                                        Color(0XFFD28D27),
                                      ],
                                    ),
                                    onPressed: () {
                                      AppRoutes.push(
                                          context, PredictionScreen());
                                    }),
                                Text(
                                  csbyid.data.games[index].team2Name,
                                  style: mediumwhiteStyle,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "      Today,30 minutes left",
                            style: GoogleFonts.openSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffB6B6B6)),
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
                              onPressed: () {},
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
