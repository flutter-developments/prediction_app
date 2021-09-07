import 'package:flutter/material.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:girafee/utils/styles.dart';

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
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

AppBar appBarwithCenterTitle(BuildContext context, String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white.withAlpha(150),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(textStyle: TextStyles.buttonFontText),
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
            backgroundColor: AppColors.greyBackColor,
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
