import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/route/route.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late String title = 'CIM-PLUS';

  login(data) {
    debugPrint("loginData: $data");
    Get.offNamed(AppRoutes.home);
  }

  validate(name) {
    if (name.length < 4) {
      return '账户错误';
    }
  }
}
