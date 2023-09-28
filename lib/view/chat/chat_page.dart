import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/style/refresh_constants.dart';
import 'package:flutter_cim_plus/style/txt_style.dart';
import 'package:flutter_cim_plus/utils/time_util.dart';
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
      appBar: AppBar(title: const Text('聊天'), centerTitle: true),
      body: GetX<ChatController>(
        builder: (controller) => EasyRefresh(
          controller: controller.refreshController,
          header: RefreshConstants.buildZhHeaders(),
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
        bool isFrom = record.uid == record.fromId;
        return Bounce(
          duration: const Duration(milliseconds: 200),
          onPressed: () => controller.toDetail(record),
          child: Container(
            decoration: const BoxDecoration(border: Border()),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                netImageCached(
                    isFrom ? record.fromAvatar ?? '' : record.avatar ?? ''),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isFrom
                              ? record.fromName ?? ''
                              : record.targetName ?? '',
                          style: TxtStyle.titleS(),
                        ),
                        Text(
                          record.content ?? '',
                          style: TxtStyle.contentS(),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  TimeUtil.formatTimeAgo(record.createTime!),
                  style: TxtStyle.contentS(color: Colors.white30),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, index) => const Divider(),
      itemCount: ChatStore.to.chatList.length,
    );
  }
}
