// import 'package:flutter/material.dart';
// import 'package:girafee/utils/routes.dart';

// class CustomDialogue extends StatelessWidget {
//   const CustomDialogue({
//     Key? key,
//     required this.height,
//     required this.widget,
//   }) : super(key: key);

//   final double height;
//   final Widget widget;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(backgroundColor: Colors.transparent, actions: [
//       Card(
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Container(
//           height: height / 1.1,
//           decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(30)),
//           child: Stack(
//             children: [
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     alignment: Alignment.bottomCenter,
//                     height: height / 1.15,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30)),
//                     child: widget),
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: InkWell(
//                   onTap: () {
//                     AppRoutes.pop(context);
//                   },
//                   child: Container(
//                     decoration: new BoxDecoration(
//                         borderRadius: BorderRadius.circular(48),
//                         boxShadow: [
//                           new BoxShadow(color: Colors.black12, blurRadius: 2)
//                         ]),
//                     child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.clear,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }
// }
