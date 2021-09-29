import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class ChampioshipApi {
  Future<http.Response> getChampionshipList() async {
    print("Signup create At ?? this link = >${API_URLS.CHAMPIONSHIP_API}"
        .toUpperCase());

    return http.get(
      Uri.parse("${API_URLS.CHAMPIONSHIP_API}"),
    );
  }
}
