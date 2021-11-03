import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/Widgets/app_drawer.dart';
import 'package:prediction_app/database/data/home_screen_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prediction_app/model/response_model/get_championship.dart';
import 'package:prediction_app/provider/championship_provider.dart';
import 'package:prediction_app/ui/home/event_screen.dart';
import 'package:prediction_app/ui/payment/payment.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'exchange_screen1.dart';
import 'notification.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  _MainScreen2State createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late ChampionshipModel championshipModel;
  bool isFetched = false;

  void initState() {
    super.initState();
    _getChampionship();
  }

  void _getChampionship() {
    Provider.of<ChampionShipProvider>(context, listen: false)
        .championshipProvider()
        .then((value) {
      setState(() {
        print(value.message.toString());
        print(value.message.toString());
        if (value.success == true) {
          _updateState(true);
          championshipModel = value;
        }
      });
    });
  }

  // ignore: unused_element
  _updateState(bool isValue) {
    isFetched = isValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background_color,
      key: _key,
      drawer: DrawerFull(context, MediaQuery.of(context).size),
      // appBar: AppBar(
      //   title: Text("title"),
      // ),
      body: isFetched == true
          ? Container(
              child: ListView(
              children: [
                buildappbarContainer(size, context),
                SizedBox(
                  height: 30.h,
                ),
                buildSuper_leauge(size),
              ],
            ))
          : Container(
              child: Center(child: CircularProgressIndicator()),
            ),
    ));
  }

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
                        //  AppRoutes.push(context, HomeScreen());
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

//main body card
// ignore: non_constant_identifier_names
  Widget buildSuper_leauge(
    Size size,
  ) {
    return Container(
      color: AppColors.primery_color,
      height: size.height * .85,
      width: size.width,
      child: ListView.builder(
          itemCount: championshipModel.data.sports.championships!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                AppRoutes.push(
                  context,
                  EventScreen(),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
                child: Container(
                  height: size.height * .28,
                  width: size.width * .491,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          spreadRadius: 1,
                          offset: Offset(0, 3.0),
                          blurRadius: 12.0,
                          color: AppColors.background_color1,
                        ),
                      ]),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            championshipModel.data.logopath +
                                "/" +
                                championshipModel.data.sports.logo,
                            fit: BoxFit.cover),
                      ),
                      ClipRRect(
                        // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //color: Colors.transparent.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  championshipModel
                                      .data.sports.championships![index].name,
                                  //     Colors.white, 23.sp, FontWeight.bold),
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  championshipModel.data.sports
                                      .championships![index].createdAt
                                      .toString(),
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
