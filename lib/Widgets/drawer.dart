// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:girafee/Widgets/appBar.dart';
// import 'package:girafee/Widgets/button.dart';
// import 'package:girafee/Widgets/dialogs.dart';
// import 'package:girafee/Widgets/profile.dart';
// import 'package:girafee/main.dart';
// import 'package:girafee/provider/user_provider.dart';
// import 'package:girafee/splashScreen.dart';
// import 'package:girafee/ui/SearchScreen/search.dart';
// import 'package:girafee/ui/auth/loginPage.dart';
// import 'package:girafee/ui/auth/signup_Page.dart';
// import 'package:girafee/ui/seller/ReportPages/Reports.dart';
// import 'package:girafee/ui/seller/advertise/add_advertisement_page.dart';
// import 'package:girafee/ui/seller/advertiser/advertiserhome.dart';
// import 'package:girafee/ui/seller/advertiser/bottom_bar/bookings.dart';
// import 'package:girafee/ui/seller/advertiser/live_ad_screen.dart';
// import 'package:girafee/ui/seller/company_pages/company_profile.dart';
// import 'package:girafee/ui/seller/company_pages/view_subscription_page.dart';
// import 'package:girafee/ui/shared/advertiser_menu_pages/helpRequestPage.dart';
// import 'package:girafee/ui/shared/advertiser_menu_pages/languagePage.dart';
// import 'package:girafee/ui/shared/chat/chat_history.dart';
// import 'package:girafee/ui/shared/review/reviews.dart';
// import 'package:girafee/ui/user/bookings/my_booking.dart';
// import 'package:girafee/ui/user/home/home.dart';
// import 'package:girafee/utils/app_colors.dart';
// import 'package:girafee/utils/localization_delegate.dart';
// import 'package:girafee/utils/routes.dart';
// import 'package:provider/provider.dart';
// import 'package:string_extensions/string_extensions.dart';
// import 'cached_image.dart';

// Widget drawerWithLogoutAndSwitchRole(BuildContext context) {
//   return Row(
//     children: <Widget>[
//       Expanded(
//         flex: 5,
//         child: Material(
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.width * 0.4,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//                   child: Row(
//                     children: <Widget>[
//                       CachedImage(
//                         radius: 80,
//                         photo: res!.displayPictureURL == null ||
//                                 res!.displayPictureURL!.isEmpty
//                             ? 'https://firebasestorage.googleapis.com/v0/b/circulate-app-a46a9.appspot.com/o/user.png?alt=media&token=4d94a267-f2da-41de-8bc2-5f2a46e321ca'
//                             : res!.displayPictureURL,
//                       ),
//                       Container(
//                           margin: EdgeInsets.only(left: 21),
//                           child: Text(
//                             '${res!.firstName!.capitalize()} ${res!.lastName!.capitalize()}',
//                             // 'usama Ali',
//                             style: TextStyle(
//                                 color: AppColors.blackTextColor,
//                                 fontWeight: FontWeight.w600),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 210,
//                 height: 48,
//                 child: ButtonWithProgressIndicator(
//                   onTap: () async {
//                     var role = res!.role;
//                     await Provider.of<UserProvider>(
//                       context,
//                       listen: false,
//                     ).switchUserRole(
//                       role == "consumer" ? "advertiser" : "consumer",
//                     );
//                     AppRoutes.replace(
//                       context,
//                       role == "advertiser" ? HomePage() : AdvertiserHomePage(),
//                     );
//                   },
//                   buttonText: res!.role == "advertiser"
//                       ? 'Consumer mode'
//                       : "Advertiser Mode",
//                   buttonTextStyle: TextStyle(color: AppColors.ChatTextColor),
//                   buttonColor: AppColors.ChatTextColor.withOpacity(0.5),
//                 ),
//               ),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     print("Logout");
//                     context.read<UserProvider>().clearUserBox();
//                     AppRoutes.replace(context, LoginPage());
//                   },
//                   child: Container(
//                     // color: Colors.green,
//                     padding: EdgeInsets.all(20),
//                     child: Row(
//                       children: <Widget>[
//                         Image.asset('assets/appIcons/icon_logout.png'),
//                         SizedBox(
//                           width: 17,
//                         ),
//                         Container(
//                           child: Text(
//                             'Logout',
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Expanded(child: drawerCloseIcon(context)),
//     ],
//   );
// }

// Widget guestUserDrawer(BuildContext context) {
//   return Row(
//     children: <Widget>[
//       Expanded(
//         flex: 5,
//         child: Material(
//           child: ListView(
//             children: <Widget>[
//               _userHeader(context),
//               SizedBox(height: 40),
//               _signupButton(context),
//               SizedBox(height: 15),
//               _loginButton(context),
//             ],
//           ),
//         ),
//       ),
//       Expanded(child: drawerCloseIcon(context)),
//     ],
//   );
// }

// Widget _loginButton(BuildContext context) {
//   return Row(
//     children: [
//       Expanded(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 30),
//           decoration: BoxDecoration(
//             color: AppColors.halfWhite,
//             borderRadius: BorderRadius.all(Radius.circular(32.0)),
//           ),
//           child: TextButton(
//             onPressed: () {
//               context.read<UserProvider>().clearUserBox();
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (c) => LoginPage(),
//                 ),
//               );
//             },
//             child: Text(
//               'Login',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _signupButton(BuildContext context) {
//   return Row(
//     children: [
//       Expanded(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 30),
//           decoration: BoxDecoration(
//             color: AppColors.greenColor,
//             borderRadius: BorderRadius.all(Radius.circular(32.0)),
//           ),
//           child: TextButton(
//             onPressed: () {
//               AppRoutes.replace(
//                   context,
//                   SignUpPage(
//                     emailController: TextEditingController(),
//                     passwordContrller: TextEditingController(),
//                   ));
//             },
//             child: Text(
//               'Sign up',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Container _userHeader(BuildContext context) {
//   return Container(
//     width: double.infinity,
//     height: MediaQuery.of(context).size.width * 0.4,
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//       child: Row(
//         children: <Widget>[
//           CachedImage(
//             radius: 80,
//             photo: res!.displayPictureURL == null ||
//                     res!.displayPictureURL!.isEmpty
//                 ? 'https://firebasestorage.googleapis.com/v0/b/circulate-app-a46a9.appspot.com/o/user.png?alt=media&token=4d94a267-f2da-41de-8bc2-5f2a46e321ca'
//                 : res!.displayPictureURL,
//           ),
//           Container(
//               margin: EdgeInsets.only(left: 21),
//               child: Text(
//                 '${res!.firstName!.capitalize()} ${res!.lastName!.capitalize()}',
//                 // 'usama Ali',
//                 style: TextStyle(
//                     color: AppColors.blackTextColor,
//                     fontWeight: FontWeight.w600),
//               ))
//         ],
//       ),
//     ),
//   );
// }

// class AdvertiserDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Material(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     children: <Widget>[
//                       userHeader(),
//                       adBroadcastPage(context),
//                       profilePage(context),
//                       myBookingsPage(context),
//                       myMessagesPage(context),
//                       myCompanyTile(context),
//                       languagePage(context),
//                       helpPage(context),
//                       termsOfUsePage(context),
//                       consumerModeButton(context),
//                     ],
//                   ),
//                 ),
//                 logoutButton(context),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//         Expanded(child: drawerCloseIcon(context)),
//       ],
//     );
//   }

//   ListTile myBookingsPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => Scaffold(
//               appBar: appBarwithCenterTitle(context, "My Bookings"),
//               body: Bookings(),
//             ),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/my_bookings_icon.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('My Bookings'),
//     );
//   }

//   ListTile myMessagesPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => ChatTab(),
//           ),
//         );
//       },
//       leading: Container(
//         child: Image.asset(
//           'assets/appIcons/messages.png',
//           height: IconTheme.of(context).size,
//           width: IconTheme.of(context).size,
//           color: Colors.black,
//         ),
//       ),
//       title: Text("My Messages"),
//     );
//   }

//   Stack drawerCloseIcon(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             margin: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height / 8,
//             ),
//             height: 50,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 )),
//             child: Center(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.clear,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//                 onPressed: () => AppRoutes.pop(context),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   ListTile logoutButton(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         print("Logout");
//         context.read<UserProvider>().clearUserBox();
//         AppRoutes.replace(context, LoginPage());
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_logout.png',
//         width: IconTheme.of(context).size,
//         height: IconTheme.of(context).size,
//       ),
//       title: Text(
//         'Logout',
//       ),
//     );
//   }

//   ListTile consumerModeButton(BuildContext context) {
//     return ListTile(
//       title: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: ButtonWithProgressIndicator(
//           onTap: () async {
//             await Provider.of<UserProvider>(
//               context,
//               listen: false,
//             ).switchUserRole("consumer");

//             AppRoutes.replace(context, SplashScreen());
//           },
//           buttonText: "Consumer mode",
//           buttonTextStyle: TextStyle(color: Colors.green),
//           buttonColor: Colors.green.shade100,
//         ),
//       ),
//     );
//   }

//   ListTile termsOfUsePage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         AppRoutes.push(
//           context,
//           Scaffold(
//             appBar: appBarwithbackIcon(context),
//             body: TermsAndConditionsDialog(
//               onClose: () => Navigator.pop(context),
//             ),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_Terms of Use.png',
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Terms of use'),
//     );
//   }

//   ListTile helpPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => HelpRequest(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_help services.png',
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text(
//         'Help',
//       ),
//     );
//   }

//   ListTile languagePage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => LanguagePage(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/world.png',
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Language'),
//     );
//   }

//   ExpansionTile myCompanyTile(BuildContext context) {
//     return ExpansionTile(
//       initiallyExpanded: false,
//       title: Text('My Company'),
//       leading: Image.asset(
//         'assets/appIcons/company.png',
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       childrenPadding: EdgeInsets.only(left: 80),
//       children: <Widget>[
//         aboutPage(context),
//         subscriptionPage(context),
//         advertisementsListPage(context),
//         reviewsPage(context),
//         reportsPage(context),
//         chatPage(context),
//       ],
//     );
//   }

//   ListTile chatPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => ChatTab(),
//           ),
//         );
//       },
//       title: Text("Chat History"),
//     );
//   }

//   ListTile reportsPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) => ReportPage()));
//       },
//       title: Text("Reports"),
//     );
//   }

//   ListTile reviewsPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) => Reviews()));
//       },
//       title: Text("Reviews"),
//     );
//   }

//   ListTile advertisementsListPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => AddAdvertisementPage(
//               onSaveAndExit: (context) => Navigator.pop(context),
//             ),
//           ),
//         );
//       },
//       title: Text("Advertisement"),
//     );
//   }

//   ListTile subscriptionPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => ViewSubscription(),
//           ),
//         );
//       },
//       title: Text("Subscription"),
//     );
//   }

//   ListTile aboutPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => CompanyProfile(
//               signupMode: false,
//               company: context.read<UserProvider>().currentUser?.company,
//               readOnly: true,
//             ),
//           ),
//         );
//       },
//       title: Text("About"),
//     );
//   }

//   ListTile profilePage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         AppRoutes.pop(context);
//         AppRoutes.push(context, Profile());
//       },
//       leading: Icon(
//         Icons.person_outline,
//         color: Colors.black,
//       ),
//       title: Text(
//         AppLocalizations.of(context)!.translate('advertiser_drawer_profile')!,
//       ),
//     );
//   }

//   ListTile adBroadcastPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => Scaffold(
//               appBar: appBarwithCenterTitle(context, 'Broadcast Ad'),
//               body: AdLiveScreen(),
//             ),
//           ),
//         );
//       },
//       title: Text(
//         AppLocalizations.of(context)!.translate('advertiser_drawer_advetise')!,
//       ),
//       leading: Image.asset(
//         'assets/appIcons/offlineVector.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//     );
//   }

//   Container userHeader() {
//     return Container(
//       child: Container(
//         margin: EdgeInsets.symmetric(
//           horizontal: 32,
//           vertical: 40,
//         ),
//         child: Row(
//           children: <Widget>[
//             CachedImage(
//               radius: 80,
//               photo: res!.displayPictureURL == null ||
//                       res!.displayPictureURL!.isEmpty
//                   ? 'https://firebasestorage.googleapis.com/v0/b/circulate-app-a46a9.appspot.com/o/user.png?alt=media&token=4d94a267-f2da-41de-8bc2-5f2a46e321ca'
//                   : res!.displayPictureURL,
//             ),
//             Container(
//                 margin: EdgeInsets.only(left: 21),
//                 child: Text(
//                   '${res!.firstName!.capitalize()} ${res!.lastName!.capitalize()}',
//                   // 'usama Ali',
//                   style: TextStyle(
//                       color: AppColors.blackTextColor,
//                       fontWeight: FontWeight.w600),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConsumerDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Material(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView(
//                     children: <Widget>[
//                       userHeader(context),
//                       searchPage(context),
//                       profilePage(context),
//                       myBookingsPage(context),
//                       myReviewsPage(context),
//                       languagePage(context),
//                       chatPage(context),
//                       termsOfUsePage(context),
//                       helpPage(context),
//                       advertiserModeButton(context),
//                     ],
//                   ),
//                 ),
//                 logoutButton(context),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//         Expanded(child: drawerCloseIcon(context)),
//       ],
//     );
//   }

//   ListTile logoutButton(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         print("Logout");
//         context.read<UserProvider>().clearUserBox();
//         AppRoutes.replace(context, LoginPage());
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_logout.png',
//         width: IconTheme.of(context).size,
//         height: IconTheme.of(context).size,
//       ),
//       title: Text(
//         'Logout',
//       ),
//     );
//   }

//   ListTile advertiserModeButton(BuildContext context) {
//     return ListTile(
//       title: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: ButtonWithProgressIndicator(
//           onTap: () async {
//             var role = res!.role;
//             await Provider.of<UserProvider>(
//               context,
//               listen: false,
//             ).switchUserRole("advertiser");

//             AppRoutes.replace(
//               context,
//               AdvertiserHomePage(),
//             );
//           },
//           buttonText: "Advertiser Mode",
//           buttonTextStyle: TextStyle(color: Colors.green),
//           buttonColor: Colors.green.shade100,
//         ),
//       ),
//     );
//   }

//   ListTile helpPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => HelpRequest(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_help services.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Help'),
//     );
//   }

//   ListTile termsOfUsePage(BuildContext context) {
//     return ListTile(
//       leading: Image.asset(
//         'assets/appIcons/icon_Terms of Use.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Consumer Term of Use'),
//     );
//   }

//   ListTile chatPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => ChatTab(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/messages.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text(
//         'Chat History',
//       ),
//     );
//   }

//   ListTile languagePage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => LanguagePage(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/world.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Language'),
//     );
//   }

//   ListTile myReviewsPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => Reviews(),
//           ),
//         );

//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (BuildContext context) =>
//         //         WriteReview(),
//         //   ),
//         // );
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_reviews.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('My reviews'),
//     );
//   }

//   ListTile myBookingsPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => MyBooking(),
//           ),
//         );
//       },
//       leading: Image.asset(
//         'assets/appIcons/my_bookings_icon.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('My bookings'),
//     );
//   }

//   ListTile profilePage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) => Profile()));
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_profile.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('My Profile'),
//     );
//   }

//   ListTile searchPage(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => SearchScreen()));
//       },
//       leading: Image.asset(
//         'assets/appIcons/icon_search.png',
//         color: Colors.black,
//         height: IconTheme.of(context).size,
//         width: IconTheme.of(context).size,
//       ),
//       title: Text('Search'),
//     );
//   }

//   Container userHeader(BuildContext context) {
//     var firstName =
//         Provider.of<UserProvider>(context).currentUser!.firstName!.capitalize();
//     var lastName =
//         Provider.of<UserProvider>(context).currentUser!.lastName!.capitalize();
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//       child: Row(
//         children: <Widget>[
//           CachedImage(
//             radius: 80,
//             photo: res!.displayPictureURL == null ||
//                     res!.displayPictureURL!.isEmpty
//                 ? 'https://firebasestorage.googleapis.com/v0/b/circulate-app-a46a9.appspot.com/o/user.png?alt=media&token=4d94a267-f2da-41de-8bc2-5f2a46e321ca'
//                 : res!.displayPictureURL,
//           ),
//           Container(
//               margin: EdgeInsets.only(left: 21),
//               child: Text(
//                 "$firstName $lastName",
//                 style: TextStyle(
//                     color: AppColors.blackTextColor,
//                     fontWeight: FontWeight.w600),
//               ))
//         ],
//       ),
//     );
//   }
// }

// Stack drawerCloseIcon(BuildContext context) {
//   return Stack(
//     children: <Widget>[
//       Align(
//         alignment: Alignment.topCenter,
//         child: Container(
//           margin: EdgeInsets.only(
//             top: MediaQuery.of(context).size.height / 10,
//           ),
//           height: 50,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               )),
//           child: Center(
//               child: IconButton(
//                   icon: Icon(
//                     Icons.clear,
//                     color: Colors.black,
//                     size: 30,
//                   ),
//                   onPressed: () => AppRoutes.pop(context))),
//         ),
//       )
//     ],
//   );
// }
