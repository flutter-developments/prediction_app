import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prediction_app/ui/home/exchange_history.dart';
import 'package:prediction_app/ui/home/notification.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/app_text_styles.dart';
import 'package:prediction_app/utils/routes.dart';

// ignore: non_constant_identifier_names
Container buildApp_bar(Size size, BuildContext context, VoidCallback onTap) {
  return Container(
    height: size.height * .136,
    width: size.width,
    decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            offset: Offset(7.0, 7.0),
            blurRadius: 40.0,
          ),
        ],
        color: AppColors.primery_color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
    child: Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: onTap,
                              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50)),
                  // child: Image.asset("assets/images/pic 2.png"),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Icon(
                Icons.arrow_back,
                size: 18,
                color: Colors.white,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "1000",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Image.asset("assets/images/doller.png")
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/Ellipse 2.png"),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Text(
                    "Get Credit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, Notifications());
                  },
                  child: Image.asset("assets/images/appbar_notification.png")),
              GestureDetector(
                  onTap: () {
                    AppRoutes.push(context, ExchangeHistory());
                  },
                  child: Image.asset("assets/images/doller_appbar.png"))
            ],
          )
        ],
      ),
    )),
  );


}

// ignore: non_constant_identifier_names
Container buildApp_only_title_bar(
    Size size, BuildContext context, String title) {
  return Container(
    height: size.height * .095,
    width: size.width,
    decoration: BoxDecoration(
      // boxShadow: <BoxShadow>[
      //   BoxShadow(
      //     color: Colors.black,
      //     offset: Offset(7.0, 7.0),
      //     blurRadius: 40.0,
      //   ),
      // ],
      color: AppColors.bar_color,
      // borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
    ),
    child: Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              AppRoutes.pop(context);
            },
          ),
          SizedBox(
            width: size.width * .25,
          ),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600))
        ],
      ),
    )),
  );
}

AppBar appBarWithLogoutAndSwitchRole(context, scaffoldKey) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        scaffoldKey.currentState.openDrawer();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, spreadRadius: 5, color: Colors.black12)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Image.asset(
          'assets/appIcons/menu.png',
          width: 50,
          height: 50,
        ),
      ),
    ),
  );
}

AppBar appBarwithbackIcon(BuildContext context, {String title = ""}) {
  return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
      leading: Image.asset("assets/images/pic 2.png"));
}

AppBar appBarwithCenterTitle(BuildContext context, String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white.withAlpha(150),
    leading: Image.asset("assets/images/pic 2.png"),
    centerTitle: true,
    title: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
        ),
      ],
    ),
  );
}

Widget appBarwithImageTitle(BuildContext context, String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.white,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: false,
    title: Row(
      children: <Widget>[
        Container(
          child: CircleAvatar(
            // backgroundColor: AppColors.greyBackColor,
            radius: 30,
            // child: Icon(Icons.person),
            backgroundImage: AssetImage('assets/appIcons/image47.png'),
          ),
        ),
        SizedBox(width: 15),
        Text(
          title,
          style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
        ),
      ],
    ),
  );
}
