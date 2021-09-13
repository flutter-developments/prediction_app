import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prediction_app/model/drawer_list_model.dart';
import 'package:prediction_app/ui/user_guide/user_guide1.dart';
import 'package:prediction_app/utils/app_colors.dart';
import 'package:prediction_app/utils/images.dart';
import 'package:prediction_app/utils/routes.dart';

List<DrawerListModel> drawerContent = [
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'EVE & Co Products',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'Eve TV Channel',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'Fitness',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'Period Tracker',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'Shop by Filter',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'Contact Us',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'My Orders',
  ),
  DrawerListModel(
    icon: Images.bow,
    screen: UserGuide(),
    title: 'FAQs',
  ),
];

class DrawerFull extends PreferredSize {
  DrawerFull(BuildContext context, Size size)
      : super(
            preferredSize: Size.fromHeight(0),
            child: Theme(
              data: ThemeData(
                canvasColor: AppColors.primery_color,
              ),
              child: Drawer(
                child: SafeArea(
                  child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            Text(''),
                            Container(
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
                                leading: Image.asset("assets/images/pic 2.png"),
                                title: Text("Tedsfdsf"),
                                subtitle: Text("sdfgsfe"),
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            Expanded(
                              flex: 5,
                              child: ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.white,
                                  );
                                },
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
                                          // fontSize: 12,
                                          fontWeight: FontWeight.w100,
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
