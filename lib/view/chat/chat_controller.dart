import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/utils/database_helper.dart';
import 'package:get/get.dart';

import '../../constant/enums.dart';

class ChatController extends GetxController {
  ChatController();

  final chatList = <ChatRecord>[].obs;

  EasyRefreshController refreshController = EasyRefreshController();
  int page = 1;
  int size = 20;

  @override
  void onInit() {
    // 初始化好友聊天记录列表
    initChatRecords(LogicType.normal.code);
    // testMsg();
    super.onInit();
  }

  Future<void> testMsg() async {
    ChatRecord record = ChatRecord(
      id: null,
      targetId: 1,
      targetName: '大飞哥',
      avatar: 'http://www.badi.com',
      content: '你好',
      msgType: 1,
      createTime: 1689264885,
      chatType: 1,
      logicType: 1,
    );
    await DatabaseHelper().insertRecord(record);
  }

  Future<void> initChatRecords(int logicType) async {
    List<ChatRecord> chats =
        await DatabaseHelper().getRecordList(page, size, logicType);
    chatList.addAll(chats);
  }
}
