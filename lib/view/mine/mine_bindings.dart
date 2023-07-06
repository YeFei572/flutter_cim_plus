import 'package:flutter_cim_plus/view/mine/mine_controller.dart';
import 'package:get/get.dart';

class MineBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}
