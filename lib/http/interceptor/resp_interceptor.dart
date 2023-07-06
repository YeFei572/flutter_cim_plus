import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RespInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200 && response.data['code'] != 0) {
      await Fluttertoast.showToast(
        msg: response.data['message'],
      );
    }
    handler.next(response);
  }
}
