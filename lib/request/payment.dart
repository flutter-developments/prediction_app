import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';

class PaymnetApi {
  Future<http.Response> getPaymnetsOffers() async {
    print("PAYEMNT_API Url = >${API_URLS.PAYEMNT_API}".toUpperCase());
    return http.get(
      Uri.parse("${API_URLS.PAYEMNT_API}"),
    );
  }

  Future<http.Response> getPaymentHistory() async {
    print("PAYEMNT_HISTORY_API Url = >${API_URLS.PAYEMNT_HISTORY_API}"
        .toUpperCase());
    return http.get(
      Uri.parse("${API_URLS.PAYEMNT_HISTORY_API}"),
    );
  }

  Future<http.Response> getrequestForWithdraw(
    String userid,
    String methodid,
    String email,
    String amount,
  ) async {
    var body = {
      "user_id": "$userid",
      "method_id": "$methodid",
      "email": "$email",
      "amount": "$amount",
    };
    print("Adds Data send is = = = = $body");
    print(
        "REQUEST_PAYEMNT_API ?? this link = >${API_URLS.REQUEST_PAYEMNT_API}");
    return http.post(
      Uri.parse("${API_URLS.REQUEST_PAYEMNT_API}"),
      body: body,
    );
  }
}
