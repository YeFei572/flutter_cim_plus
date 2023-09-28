import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/view/chat/detail/chat_view.dart';
import 'package:get/get.dart';

import '../../constant/enums.dart';
import '../../store/chat_store.dart';

class ChatController extends GetxController {
  ChatController();

  EasyRefreshController refreshController = EasyRefreshController();
  int page = 1;
  int size = 50;

  @override
  void onInit() {
    // 初始化好友聊天记录列表
    initChatRecords(LogicType.normal.code);
    // testMsg();
    super.onInit();
  }

  Future<void> initChatRecords(int logicType) async {
    ChatStore.to.loadChatList(page, size, logicType);
  }

  Future<void> toDetail(ChatRecord record) async {
    bool isTarget = record.uid == record.targetId;
    Get.to(
      () => ChatView(
        id: record.uid.toString(),
        avatar: isTarget ? record.avatar ?? '' : record.fromAvatar ?? '',
        title: isTarget ? record.targetName ?? '' : record.fromName ?? '',
      ),
    );
  }
}
