import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/view/chat/chat_controller.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(child: Text('好友')),
      ),
    );
  }
}
