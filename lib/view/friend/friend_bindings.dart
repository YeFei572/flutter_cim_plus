import 'package:get/get.dart';

import 'friend_controller.dart';

class FriendBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendController>(() => FriendController());
  }
}
