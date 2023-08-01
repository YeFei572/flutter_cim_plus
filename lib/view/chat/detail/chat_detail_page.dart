import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_cim_plus/view/chat/detail/chat_detail_controller.dart';
import 'package:get/get.dart';

class ChatDetailPage extends GetView<ChatDetailController> {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.rxTitle.value)),
        centerTitle: true,
      ),
      body: GetX<ChatDetailController>(
        builder: (controller) => Chat(
          messages: controller.messages,
          onSendPressed: (msg) {},
          user: controller.target.value,
        ),
      ),
    );
  }
}
