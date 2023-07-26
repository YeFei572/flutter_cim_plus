import 'package:flutter_cim_plus/model/user_info.dart';
import 'package:get/get.dart';

import '../../utils/log_utils.dart';

class MineController extends GetxController {
  MineController();

  Rx<UserInfo>? rxInfo;

  @override
  void onInit() async {
    LogI('加载');
    super.onInit();
  }
}
