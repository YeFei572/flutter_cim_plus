import 'package:flutter_cim_plus/view/discover/discover_controller.dart';
import 'package:get/get.dart';

class DiscoverBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverController>(() => DiscoverController());
  }
}
