import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../route/route.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String? route) {
    return const RouteSettings(name: AppRoutes.login);
  }
}
