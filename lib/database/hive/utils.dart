import 'hive_initilization.dart';

class Utils {
  static String getAuthentication() {
    return "Bearer ${user!.token}";
  }

  static String getUserid() {
    return user!.id;
  }

  static String userName() {
    return user!.name;
  }

  static String email() {
    return user!.email;
  }
}
