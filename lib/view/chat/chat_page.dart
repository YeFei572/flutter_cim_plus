import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/view/chat/chat_controller.dart';
import 'package:flutter_cim_plus/widget/net_image_cached.dart';
import 'package:get/get.dart';

import '../../constant/enums.dart';
import '../../store/chat_store.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天'),
        centerTitle: true,
      ),
      body: GetX<ChatController>(
        builder: (controller) => EasyRefresh(
          controller: controller.refreshController,
          onRefresh: () => controller.initChatRecords(LogicType.normal.code),
          child: _buildFriendItems(),
        ),
      ),
    );
  }

  Widget _buildFriendItems() {
    return ListView.separated(
      itemBuilder: (_, index) {
        ChatRecord record = ChatStore.to.chatList[index];
        return Bounce(
          duration: const Duration(milliseconds: 200),
          onPressed: () => controller.toDetail(record),
          child: ListTile(
            leading: netImageCached(record.avatar ?? ''),
            title: Text(record.targetName ?? ''),
            subtitle: Text(record.content ?? ''),
          ),
        );
      },
      separatorBuilder: (_, index) => const Divider(),
      itemCount: ChatStore.to.chatList.length,
    );
  }
}
