// import 'package:flutter/material.dart';
// import 'package:girafee/utils/app_colors.dart';

// displayFaceBookButton(String tag, VoidCallback? onTap) {
//   return Container(
//     decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.3),
//         spreadRadius: 2,
//         blurRadius: 10,
//       )
//     ]),
//     child: FloatingActionButton(
//       heroTag: tag,
//       backgroundColor: Colors.white,
//       mini: false,
//       elevation: 0,
//       onPressed: onTap,
//       child: Image.asset('assets/appIcons/facebook.png'),
//     ),
//   );
// }

// displayTwitterButton(String tag, VoidCallback? onTap) {
//   return Container(
//     decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.3),
//         spreadRadius: 2,
//         blurRadius: 10,
//       )
//     ]),
//     child: FloatingActionButton(
//       heroTag: tag,
//       backgroundColor: Colors.white,
//       mini: false,
//       elevation: 0,
//       onPressed: onTap,
//       child: Image.asset('assets/appIcons/twitter.png', scale: 15),
//     ),
//   );
// }

// displayLinkedinButton(BuildContext context, {required onPressed}) {
//   return Container(
//     decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.3),
//         spreadRadius: 2,
//         blurRadius: 10,
//       )
//     ]),
//     child: FloatingActionButton(
//       heroTag: 'linkedin',
//       backgroundColor: Colors.white,
//       mini: false,
//       elevation: 0,
//       onPressed: onPressed,
//       child: Image.asset(
//         'assets/appIcons/linkedin.png',
//         scale: 20,
//       ),
//     ),
//   );
// }

// Widget displayAddButton(String tag, BuildContext context, VoidCallback onTap) {
//   return CircleAvatar(
//     radius: 20,
//     child: FloatingActionButton(
//       heroTag: tag,
//       backgroundColor: AppColors.yellowColor,
//       mini: false,
//       onPressed: onTap,
//       // onPressed: ()=>displayAddTeamMemberDialogue(context),

//       child: Icon(
//         Icons.add,
//         color: AppColors.blackTextColor,
//         size: 25,
//       ),
//     ),
//   );
// }
