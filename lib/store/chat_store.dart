import 'package:flutter_cim_plus/constant/enums.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/utils/database_helper.dart';
import 'package:get/get.dart';

/// 聊天会话store
class ChatStore extends GetxController {
  static ChatStore get to => Get.find();
  int page = 1;
  int size = 50;
  final _chatList = <ChatRecord>[].obs;

  List<ChatRecord> get chatList => _chatList;

  @override
  void onInit() {
    super.onInit();

    /// 初始化会话记录
    loadChatList(page, size, LogicType.normal.code);
  }

  /// 加载会话记录
  Future<void> loadChatList(int page, int size, int logicType) async {
    page = page;
    size = size;
    List<ChatRecord> chats =
        await DatabaseHelper().getRecordList(page, size, logicType);
    _chatList.value = chats;
  }

  /// 发送消息会话
  Future<void> sendMsg(ChatRecord record) async {
    // 将数据插入到本地数据库
    await DatabaseHelper().insertRecord(record);
    // 更新会话列表
    _chatList.clear();
    loadChatList(page, size, LogicType.normal.code);
  }
}
