import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  ChatDetailController();

  RxString rxTitle = ''.obs;
  final messages = <types.Message>[].obs;
  Rx<types.User> target = Rx<types.User>(
    types.User(
      id: Get.parameters['id'] ?? '',
      imageUrl: Get.parameters['avatar'] ?? '',
    ),
  );

  @override
  void onInit() {
    super.onInit();
    rxTitle.value = Get.parameters['title'] ?? '';
    LogI('title is : ${rxTitle.value}');
  }
}
