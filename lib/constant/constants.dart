import 'package:flutter/foundation.dart';

class Constant {
  static const String baseUrl = 'http://192.168.31.176:17593';
  // static const String baseUrl = 'http://159.75.253.90:15793';

  /// 运行忽略请求头的地址
  static const List<String> ignorePath = [
    '/login',
    '/register',
  ];

  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  static bool PROXY_ENABLE = false;
  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';
}
