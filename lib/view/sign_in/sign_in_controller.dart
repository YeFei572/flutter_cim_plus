import 'package:flutter_cim_plus/model/base_entity.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../http/apiservice/api_service.dart';
import '../../model/user_info.dart';

class SignInController extends GetxController {
  late String title = 'CIM-PLUS';

  Future<String?>? login(LoginData data) async {
    final Map<String, String> loginData = {
      'phone': data.name,
      'password': data.password
    };
    BaseEntity<UserInfo> resp = await ApiService().login(loginData);
    if (resp.code == 0) {}
    //   Get.offNamed(AppRoutes.home);
    LogI('----> $loginData');
    return 'null';
  }

  validate(name) {
    if (name.length < 4) {
      return '账户错误';
    }
  }
}
