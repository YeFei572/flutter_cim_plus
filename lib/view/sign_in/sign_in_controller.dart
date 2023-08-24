import 'package:flutter_cim_plus/model/base_entity.dart';
import 'package:flutter_cim_plus/store/user_store.dart';
import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../http/apiservice/api_service.dart';
import '../../model/user_info.dart';
import '../../route/route.dart';

class SignInController extends GetxController {
  late String title = 'CIM-PLUS';

  Future<String?>? login(LoginData data) async {
    final Map<String, String> loginData = {
      'phone': data.name,
      'password': data.password
    };
    BaseEntity<UserInfo> resp = await ApiService().login(loginData);
    if (resp.code == 0 && resp.data != null) {
      StoreUtil.store.write('userInfo', resp.data);
      UserStore.to.updateInfo(resp.data!);
      Get.offAndToNamed(AppRoutes.home);
    } else {
      return resp.message;
    }
  }

  validate(name) {
    if (name.length < 4) {
      return '账户错误';
    }
  }
}
