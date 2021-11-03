import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class UserApi {
  Future<http.Response> getProfile() async {
    print("PROFILE_API Url = >${API_URLS.PROFILE_API}".toUpperCase());
    return http.get(
      Uri.parse("${API_URLS.PROFILE_API}"),
    );
  }

  Future<http.Response> contactUsCall(String name, String email, String phone,
      String image, String comment) async {
    var body = {
      "user_id": "2",
      "name": "$name",
      "email": "$email",
      "phone": "$phone",
      "comments": "$comment",
      "attachment": "$image",
    };
    print("Adds Data getten is = = = = $body");
    print("CONTACT_US_API ?? this link = >${API_URLS.CONTACT_US_API}");
    return http.post(
      Uri.parse("${API_URLS.CONTACT_US_API}"),
      body: body,
    );
  }
}
