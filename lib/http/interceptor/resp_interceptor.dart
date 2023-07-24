import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter_cim_plus/route/names.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RespInterceptor extends Interceptor {
  @override
  void onResponse(
      d.Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200 && response.data['code'] != 0) {
      await Fluttertoast.showToast(
        msg: response.data['message'],
      );
      if (response.data['code'] == -1) {
        Get.offAndToNamed(AppRoutes.login);
      }
    }
    handler.next(response);
  }
}
