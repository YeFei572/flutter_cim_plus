import 'package:flutter/cupertino.dart';
import 'package:flutter_cim_plus/route/route.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (route == AppRoutes.login) {
      return null;
    } else {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.snackbar('警告', '登录过期，请重新登录！'),
      );
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
