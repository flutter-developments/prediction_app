// import 'package:flutter/material.dart';
// import 'package:girafee/model/response_model/getMymsg.dart';
// import 'package:girafee/provider/chat_provider.dart';
// import 'package:girafee/ui/shared/chat/chat_history.dart';
// import 'package:provider/provider.dart';

// class Personcard extends StatelessWidget {
//   final Person? person;
//   final Function? onTap;
//   final List<Message>? previousMessages;

//   Personcard({
//     this.person,
//     this.onTap,
//     this.previousMessages,
//   });
//   @override
//   Widget build(BuildContext context) {
//     List<Message> unreadMessages = Provider.of<ChatProvider>(context)
//         .getAllUnreadMessagesByUser(this.person!.id);

//     int unreadMessagesCount = unreadMessages.length;
//     // print(unreadMessages);

//     // List<Message> allMessages = [
//     //   ...unreadMessages,
//     //   ...Provider.of<ChatProvider>(context)
//     //       .getAlldMessagesByUser(this.person.id)
//     // ];
//     return Column(children: <Widget>[
//       ListTile(
//         onTap: this.onTap as void Function()?,
//         leading: CircleAvatar(
//           radius: 30.0,
//           child: person!.photo == null
//               ? Icon(Icons.person)
//               : Image.network(person!.photo!),
//         ),
//         title: Text(
//           person!.name!,
//         ),
//         subtitle: previousMessages!.isEmpty
//             ? Container()
//             : Text(
//                 previousMessages!.last.text!,
//               ),
//         trailing: Visibility(
//           visible: unreadMessagesCount != 0,
//           child: Container(
//             padding: EdgeInsets.all(1),
//             decoration: new BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(6),
//             ),
//             constraints: BoxConstraints(
//               minWidth: 12,
//               minHeight: 12,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 unreadMessagesCount.toString(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ]);
//   }
// }
