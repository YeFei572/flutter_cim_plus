import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:get/get.dart';

import '../model/user_info.dart';

/// 用户store
class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _userInfo = UserInfo().obs;

  UserInfo get info => _userInfo.value;

  @override
  void onInit() {
    super.onInit();
    loadInfo();
  }

  Future<void> loadInfo() async {
    UserInfo? temp = await StoreUtil.loadInfo();
    if (null != temp) {
      _userInfo.value = temp;
    }
  }

  Future<void> updateInfo(UserInfo info) async {
    _userInfo.value = info;
  }
}
