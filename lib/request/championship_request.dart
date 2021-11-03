import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class ChampionshipApi {
  Future<http.Response> requestChampionshipList() async {
    print("getChampionshipList this link = >${API_URLS.CHAMPIONSHIP_API}"
        .toUpperCase());

    return http.get(
      Uri.parse("${API_URLS.CHAMPIONSHIP_API}"),
    );
  }

  Future<http.Response> requestgetGamesByChampionshipID() async {
    print(
        "requestgetGamesByChampionshipID this link = >${API_URLS.CHAMPIONSHIPGEMEBYID_API}"
            .toUpperCase());

    return http.get(
      Uri.parse("${API_URLS.CHAMPIONSHIPGEMEBYID_API}"),
    );
  }

  Future<http.Response> requestGameDetailesByID() async {
    print(
        "requestgetGamesByChampionshipID this link = >${API_URLS.PERDICTQUESTION_API}"
            .toUpperCase());

    return http.get(
      Uri.parse("${API_URLS.PERDICTQUESTION_API}"),
    );
  }
}
