import 'package:flutter_cim_plus/view/chat/chat_controller.dart';
import 'package:get/get.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
