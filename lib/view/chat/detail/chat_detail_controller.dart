import 'package:flutter/cupertino.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/model/user_info.dart';
import 'package:flutter_cim_plus/store/user_store.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../constant/enums.dart';
import '../../../utils/database_helper.dart';

class ChatDetailController extends GetxController {
  ChatDetailController();

  ScrollController scrollController = ScrollController();
  late ListObserverController observerController;
  late ChatScrollObserver chatObserver;
  RxString rxTitle = ''.obs;
  RxInt rxUserId = 0.obs;
  RxString rxAvatar = ''.obs;
  final messages = <ChatRecord>[].obs;

  int page = 1;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    rxTitle.value = Get.parameters['title'] ?? '';
    rxAvatar.value = Get.parameters['avatar'] ?? '';
    rxUserId.value = Get.parameters['id'] == null
        ? 0
        : int.parse(Get.parameters['id'].toString());
    LogI('title is : ${rxTitle.value}');
    // 初始化当前用户的聊天记录
    messages.clear();
    getConversion();
  }

  Future<void> getConversion() async {
    List<ChatRecord> records =
        await DatabaseHelper().getConversionList(page, size, rxUserId.value);
    messages.addAll(records);
  }

  Future<void> sendMsg(String msg) async {
    UserInfo me = UserStore.to.info;
    ChatRecord record = ChatRecord(
      avatar: rxAvatar.value,
      targetId: rxUserId.value,
      targetName: rxTitle.value,
      content: msg,
      fromId: int.tryParse(me.id.toString()),
      fromName: me.nickname,
      fromAvatar: me.avatar,
      msgType: MsgType.txtMsg.code,
      chatType: ChatType.p2p.code,
      createTime: DateTime.now().second,
      logicType: LogicType.friend.code,
    );
    await DatabaseHelper().insertRecord(record);
    messages.add(record);
  }
}
