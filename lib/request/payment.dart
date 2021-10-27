import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class PaymnetApi {
  Future<http.Response> getPaymnetsOffers() async {
    print("PAYEMNT_API Url = >${API_URLS.PAYEMNT_API}".toUpperCase());
    return http.get(
      Uri.parse("${API_URLS.PAYEMNT_API}"),
    );
  }
}
