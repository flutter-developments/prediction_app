// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:async/async.dart';
// import '../main.dart';
// import 'package:http/http.dart' as http;

// class UploadImage {
//   String? imageUrl;

//   Future<http.StreamedResponse> uploadImage(
//       File file, BuildContext context, String url) async {
//     Map<String, String> headers = ({
//       "Content-Type": "multipart/form-data",
//       "Authorization": "Bearer ${res!.accessToken} ",
//     });
//     print('starting to send the file');
//     print("Sendiing Header is  = " + headers.toString());
//     // ignore: deprecated_member_use
//     var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
//     // get file length
//     var length = await file.length();

//     // string to uri
//     var uri = Uri.parse("$url");
//     print("URI =  = = " + uri.toString());
//     // create multipart request
//     var request = new http.MultipartRequest("POST", uri);
//     request.fields['firstName'] = 'usama';
//     request.headers.addAll(headers);

//     // multipart that takes file
//     var multipartFile = new http.MultipartFile('file', stream, length,
//         filename: file.path.split('/').last);

//     // add file to multipart
//     request.files.add(multipartFile);

//     // send
//     return await request.send();
//     // print("Status code  = ");
//   }
// }
