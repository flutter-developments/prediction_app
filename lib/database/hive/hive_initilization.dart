import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../../main.dart';
import 'user_box.dart';

UserBox? user;
Box<dynamic>? boxUser;

class HiveInitialization {
  static Box<dynamic>? boxUser;
  Dio dio = Dio();
  static Future<bool> hiveData() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(UserBoxAdapter());
    boxUser = await Hive.openBox("user");
    print("Accounts exist in local db " +
        boxUser!.length.toString().toUpperCase());
    if (boxUser!.length == 0) {
      print('Accounts :  0'.toUpperCase());
      return false;
    } else {
      user = boxUser!.get(0) as UserBox;
      return true;
    }
    // final appDocumentDir =
    //     await path_provider.getApplicationDocumentsDirectory();
    // Hive.init(appDocumentDir.path);
    // Hive.registerAdapter(UserBoxAdapter());
    // boxUser = await Hive.openBox("user");
    // print('Account Save in localdb is :${boxUser!.length}'.toUpperCase());
    // if (boxUser!.length == 0) {
    //   return false;
    // } else {
    //   // ignore: deprecated_member_use_from_same_package
    //   res = boxUser!.get(0) as UserBox;
    //   print(res!.token.toString());
    //   return true;
    // }
  }
}
