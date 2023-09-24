import 'package:renew_buy/core/utils/environment.dart';

class ApiEndpoints{

  /// Base Url ///
  static String apiBaseUrl = Environment.apiBaseUrl;

  /// Module APIs ///
  static const String getFeed = "c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";
}

class Assets{
  static String notification = 'assets/icons/notification.svg';
  static String sidebar = 'assets/icons/sidebar.svg';
  static String search = 'assets/icons/search.svg';
  static String placeholder = 'assets/images/placeholder.png';
}