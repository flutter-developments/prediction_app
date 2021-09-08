// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:girafee/Widgets/button.dart';
// import 'package:girafee/ui/seller/advertise/ad_page_widgets.dart';
// import 'package:girafee/utils/app_colors.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:girafee/utils/styles.dart';

// class GeneralDialogs {
//   static Future showSuccessDialog(context, String message) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return SuccessDialog(
//           message: message,
//         );
//       },
//     );
//   }

//   static Future showOopsDialog(context, String message) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return OopsDialog(
//           message: message,
//         );
//       },
//     );
//   }

//   static Future showYesNoDialog(
//     context, {
//     required String message,
//     required Function onYes,
//     required Function onNo,
//   }) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return YesNoDialog(
//           message: message,
//           onYes: onYes,
//           onNo: onNo,
//         );
//       },
//     );
//   }

//   static Future showTermsAndConditionsDialog(context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return TermsAndConditionsDialog();
//       },
//     );
//   }
// }

// class YesNoDialog extends StatelessWidget {
//   final String message;
//   final Function onYes;
//   final Function onNo;

//   const YesNoDialog({
//     Key? key,
//     required this.message,
//     required this.onYes,
//     required this.onNo,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       content: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               message,
//               style: TextStyles.normalFontText,
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 30),
//             Row(
//               children: [
//                 Expanded(
//                   child: ButtonWithoutFixedWidth(
//                     buttonText: "Yes",
//                     buttonColor: AppColors.redColor,
//                     onTap: () => this.onYes(),
//                     elevation: 2,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: ButtonWithoutFixedWidth(
//                     buttonText: "No",
//                     onTap: () => Navigator.pop(context),
//                     elevation: 2,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OopsDialog extends StatelessWidget {
//   final String message;

//   const OopsDialog({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       content: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'OOPS!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 color: AppColors.redColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               message,
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 30),
//             ButtonWithoutFixedWidth(
//               buttonText: "OK",
//               onTap: () => Navigator.pop(context),
//               elevation: 2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SuccessDialog extends StatelessWidget {
//   final String message;

//   const SuccessDialog({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       content: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'SUCCESS!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 20,
//                 color: AppColors.greenColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               message,
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 30),
//             ButtonWithoutFixedWidth(
//               buttonText: "OK",
//               onTap: () => Navigator.pop(context),
//               elevation: 2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TermsAndConditionsDialog extends StatelessWidget {
//   TermsAndConditionsDialog({
//     Key? key,
//     this.onClose,
//   }) : super(key: key);
//   final void Function()? onClose;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Expanded(child: termsAndConditions()),
//               ],
//             ),
//           ),
//           closeButton(context),
//         ],
//       ),
//     );
//   }

//   Positioned closeButton(BuildContext context) {
//     return Positioned(
//       top: -20,
//       right: -20,
//       child: InkWell(
//         onTap: this.onClose ?? () => Navigator.pop(context),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.close),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget termsAndConditions() {
//     return WebView(
//       initialUrl: 'about:blank',
//       onWebViewCreated: (WebViewController webViewController) {
//         var _controller = webViewController;
//         _loadHtmlFromAssets(_controller);
//       },
//     );
//   }

//   _loadHtmlFromAssets(WebViewController controller) async {
//     String fileText = await rootBundle.loadString(
//       'assets/legal/Giraffe_Terms_and_Conditions.html',
//     );

//     fileText +=
//         '\n' + await rootBundle.loadString('assets/legal/Giraffe_Privacy.html');

//     fileText += '\n' +
//         await rootBundle.loadString('assets/legal/Giraffe_Disclaimer.html');

//     controller.loadUrl(
//       Uri.dataFromString(
//         fileText,
//         mimeType: 'text/html',
//         encoding: Encoding.getByName('utf-8'),
//       ).toString(),
//     );
//   }
// }
