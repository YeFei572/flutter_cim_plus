import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/store/user_store.dart';
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
        builder: (controller) => Stack(
          children: [
            _buildMessageList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  controller.messages.length,
                  (index) =>
                      _buildMessageItem(controller.messages.value[index])),
            ),
          ),
        ),
        // MessageBar(
        //   messageBarColor: const Color(0xff2b2b2b),
        //   replyWidgetColor: const Color(0xff878181),
        //   onSend: (msg) => controller.sendMsg(msg),
        // )
      ],
    );
  }

  Widget _buildMessageItem(ChatRecord record) {
    bool isSender = record.fromId == UserStore.to.info.id;
    return Container();
    // return BubbleNormal(
    //   text: record.content ?? '',
    //   isSender: isSender,
    //   color: isSender ? Colors.green : Colors.white,
    //   bubbleRadius: 8.0,
    //   textStyle: TextStyle(
    //     fontSize: 14,
    //     color: isSender ? Colors.white : Colors.black,
    //   ),
    // );
    /*if (record.fromId == currentUserId) {
      return Row(
        children: [
          BubbleNormal(
            text: record.content ?? '',
            isSender: true,
            color: Colors.pinkAccent,
            bubbleRadius: 10.0,
            textStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          CircleAvatar(
            radius: 10.0,
            child: netImageCached(record.fromAvatar ?? ''),
          )
        ],
      );
    }
    return Row(
      children: [
        CircleAvatar(
          radius: 10.0,
          child: netImageCached(record.fromAvatar ?? ''),
        ),
        BubbleNormal(
          text: record.content ?? '',
          isSender: false,
          color: Colors.grey,
          bubbleRadius: 10.0,
          textStyle: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );*/
  }
}
