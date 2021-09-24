import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class AuthApi {
  Future<http.Response> createUser(
    String name,
    String email,
    String password,
    String conformPassword,
  ) async {
    var body = {
      "email": "$email",
      "password": "$password",
      "c_password": "$conformPassword",
      "name": "$name",
    };
    print(body.toString());
    print("Adds Data getten is = = = = $body");
    print("Signup create At ?? this link = >${API_URLS.REGISTER_API}");
    return http.post(
      Uri.parse("${API_URLS.REGISTER_API}"),
      body: body,
    );
  }

  Future<http.Response> loginUser(
    String email,
    String password,
  ) async {
    var body = {
      "email": "$email",
      "password": "$password",
    };
    print(body.toString());
    print("Adds Data getten is = = = = $body");
    print("Login create At ?? this link = >${API_URLS.LOGIN_API}");
    return http.post(
      Uri.parse("${API_URLS.LOGIN_API}"),
      body: body,
    );
  }
}
