import 'package:http/http.dart' as http;
import 'package:prediction_app/api/prodection_api.dart';
import 'package:sigv4/sigv4.dart';

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

  // Future<http.Response> loginUser(
  //   String email,
  //   String password,
  // ) async {
  //   final client = Sigv4Client(
  //     keyId: 'A4mmcuQ/W7jAUFtWiFO7W+FHttdkmBSLshsxorqV',
  //     accessKey: 'AKIAU555LSO3QN24DLE4',
  //     region: 'eu-west-2',
  //     serviceName: 'execute-api',
  //   );
  //   //final request = client.request('');

  //   // var headers = {
  //   //   'X-Amz-Content-Sha256':
  //   //       'beaead3198f7da1e70d03ab969765e0821b24fc913697e929e726aeaebf0eba3',
  //   //   'X-Amz-Date': '20210926T123833Z',
  //   //   'Authorization':
  //   //       'AWS4-HMAC-SHA256 Credential=AKIAU555LSO3QN24DLE4/20210926/eu-west-2/execute-api/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=60c13d21197b99ee0c6448fb842fe7f74aa36fcc93e3579b2b169f12230b656e',
  //   //   'Content-Type': 'application/json'
  //   // };

  //   final request = client.request(
  //     'https://yhl1feomo7.execute-api.eu-west-2.amazonaws.com/tablelist',
  //     method: 'POST',
  //     body: '''{\n    "unique_id":"60052e6447c6a"\n}''',
  //   );

  //   return http.post(request.url, body: request.body);

  //   // var body = {
  //   //   "unique_id": "60052e6447c6a",
  //   // };

  //   // var headers = {
  //   //   'X-Amz-Content-Sha256':
  //   //       'beaead3198f7da1e70d03ab969765e0821b24fc913697e929e726aeaebf0eba3',
  //   //   'X-Amz-Date': '20210926T131432Z',
  //   //   'Authorization':
  //   //       'AWS4-HMAC-SHA256 Credential=AKIAU555LSO3QN24DLE4/20210926/eu-west-2/execute-api/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=b0e0328f0e65d1c2ad3bb92d6b908e155d97faaea68392120274d7c62eba300e',
  //   // };

  //   // print(body.toString());
  //   // print("Adds Data getten is = = = = $body");
  //   // print("Login create At ?? this link = >${API_URLS.LOGIN_API}");
  //   // return http.post(
  //   //     Uri.parse(
  //   //         'https://yhl1feomo7.execute-api.eu-west-2.amazonaws.com/tablelist'),
  //   //     body: body,
  //   //     headers: headers);
  // }

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
