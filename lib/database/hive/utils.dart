import '../../main.dart';

class Utils {
  static String getAuthentication() {
    return "Bearer ${res!.token}";
  }

  static String getUserid() {
    return res!.id;
  }

  static String userName() {
    return res!.name;
  }

  static String email() {
    return res!.email;
  }
}
