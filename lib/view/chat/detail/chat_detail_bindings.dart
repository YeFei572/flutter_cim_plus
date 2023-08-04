import 'package:flutter_cim_plus/view/chat/detail/chat_detail_controller.dart';
import 'package:get/get.dart';

class ChatDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
  }
}
