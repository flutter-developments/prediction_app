import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/drawer_list_model.dart';
import 'package:prediction_app/ui/home/main_screen.dart';
import 'package:prediction_app/ui/user_guide/user_guide1.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/images.dart';
import 'package:prediction_app/utils/routes.dart';

List<DrawerListModel> drawerContent = [
  DrawerListModel(
    icon: Images.home,
    screen: MainScreen(),
    title: 'Home',
  ),
  DrawerListModel(
    icon: Images.prediction,
    screen: UserGuide(),
    title: 'My Predictions',
  ),
  DrawerListModel(
    icon: Images.exchnage,
    screen: UserGuide(),
    title: 'Exchange History',
  ),
  DrawerListModel(
    icon: Images.settings,
    screen: UserGuide(),
    title: 'Settings',
  ),
  DrawerListModel(
    icon: Images.withdraw,
    screen: UserGuide(),
    title: 'Withdrawal',
  ),
  DrawerListModel(
    icon: Images.userGuide,
    screen: UserGuide(),
    title: 'User Guide',
  ),
  DrawerListModel(
    icon: Images.premium,
    screen: UserGuide(),
    title: 'Upgrade to Premium',
  ),
  DrawerListModel(
    icon: Images.signOut,
    screen: UserGuide(),
    title: 'Sign out',
  ),
];

class DrawerFull extends PreferredSize {
  DrawerFull(BuildContext context, Size size)
      : super(
            preferredSize: Size.fromHeight(0),
            child: Theme(
              data: ThemeData(
                canvasColor: AppColors.bar_color,
              ),
              child: Drawer(
                child: SafeArea(
                  child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset("assets/images/Group 42.png"),
                            ),
                            Text(''),
                            Center(
                              child: Container(
                                height: size.height * .1,
                                width: size.width * .7,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: new LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColors.gradiantColor1,
                                      AppColors.gradiantColor2,
                                    ],
                                  ),
                                ),
                                child: ListTile(
                                  leading: ClipOval(
                                    child: Image.asset("assets/images/pic 2.png"),
                                  ),
                                  title: Text(
                                    "User ABCD",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "123,4548.32",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                           
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              flex: 5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: drawerContent.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 50,
                                    child: ListTile(
                                      onTap: () => AppRoutes.push(
                                          context, drawerContent[index].screen),
                                      leading: Image.asset(
                                        drawerContent[index].icon,
                                        color: Colors.white,
                                        scale: 1.5,
                                      ),
                                      title: Text(
                                        drawerContent[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ));
}
