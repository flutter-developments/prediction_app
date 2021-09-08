// import 'package:flutter/material.dart';
// import 'package:girafee/provider/user_provider.dart';
// import 'package:provider/provider.dart';

// class BodyCardWithProfilePicture extends StatelessWidget {
//   final Widget content;
//   const BodyCardWithProfilePicture({Key? key, required this.content})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var logoURL = context.watch<UserProvider>().currentUser?.company?.logoURL;
//     return Stack(
//       clipBehavior: Clip.none,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 20,
//             right: 20,
//             top: 20,
//             bottom: 10,
//           ),
//           child: Card(
//             elevation: 10,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: this.content,
//             ),
//           ),
//         ),
//         Positioned(
//           top: -20,
//           left: 0,
//           right: 0,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundImage:
//                   logoURL == null ? null : NetworkImage(logoURL ?? ""),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
