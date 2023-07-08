import 'package:dio/dio.dart';
import 'package:flutter_cim_plus/constant/constants.dart';
import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../model/user_info.dart';

///请求参数拦截器
class HttpParamsInterceptor extends Interceptor {
  static const VERSION = "version";
  static const TOKEN = "token";
  static const DEVICE_NO = "deviceNo";
  static const APP_TYPE_KEY = "appType";
  static const APP_TYPE_VALUE = "Android";
  static const APP_ID_KEY = "appId";
  static const JSON_BODY = "jsonBody";
  static const SIGN = "sign";
  static const TIMESTAMP = "timestamp";
  static const UTF_8 = "UTF-8";
  static const APP_ID = "test_android";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Constant.ignorePath.contains(options.path)) {
      Map<String, dynamic> headers = options.headers;

      /// 开始读取token
      UserInfo info = StoreUtil.store.read('userInfo');
      if (null == info && info.token.isEmpty) {
        Fluttertoast.showToast(msg: '没有登录！');
        return;
      }
      headers = {'cim-plus': info.token};
      options.headers.addAll(headers);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
