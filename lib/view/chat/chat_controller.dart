import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_cim_plus/utils/database_helper.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  final chatList = [].obs;

  EasyRefreshController refreshController = EasyRefreshController();

  @override
  void onInit() {
    // 初始化好友聊天记录列表
    initChatRecords();
    super.onInit();
  }

  Future<void> initChatRecords() async {
    DatabaseHelper.getRecordList()
  }
}
