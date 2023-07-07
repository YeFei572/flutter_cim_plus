import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
