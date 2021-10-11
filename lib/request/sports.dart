import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class SportsApi {
  Future<http.Response> getSportsList() async {
    print("Supports Url = >${API_URLS.SPORTS_API}".toUpperCase());
    return http.get(
      Uri.parse("${API_URLS.SPORTS_API}"),
    );
  }
}
