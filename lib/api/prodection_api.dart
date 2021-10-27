import 'config.dart';

// ignore: camel_case_types
class API_URLS {
  static const REGISTER_API = "$API_URL/register";
  static const LOGIN_API = "$API_URL/login";

  static const SPORTS_API = "$API_URL/sports";
  static const CHAMPIONSHIP_API = "$API_URL/sports/1";
  static const CHAMPIONSHIPGEMEBYID_API = "$API_URL/getGamesByChampionshipID/1";
  static const CHAMPIANLEADTEAMIMAGE_API = "$WITHOUT_API_URL/uploads";
  static const PERDICTQUESTION_API = "$API_URL/games/1";

  static const PAYEMNT_API = "$API_URL/payment_methods";
  static const GET_A_CATEGORY_API = "$API_URL/category/";

  static const UPLOAD_IMAGE_ADS_API = "$API_URL/images/ads";
  static const UPLOAD_VIDEO_ADS_API = "$API_URL/videos/ads";
  static const DELETE_IMG = "$API_URL/images/ads";
  static const GET_USER = "$API_URL/users";
  static const LIVE_AD = "$API_URL/live";

  static const CONTACT = "$API_URL/contact";
  static const CHAT = "$API_URL/message";
  static const JOB_REQUEST = "$API_URL/job";
  static const GETACOMPANY_API = "$API_URL/company";
  static const GETMYREVIEWS_API = "$API_URL/rating/my";
  static const SENDREVIEWS_API = "$API_URL/rating";

  static const CHAT_SOCKET = CHAT_SOCKET_URL;
  static const LOCATION_SOCKET = LOCATION_SOCKET_URL;
  static const JOB_SOCKET = JOB_SOCKET_URL;
}
