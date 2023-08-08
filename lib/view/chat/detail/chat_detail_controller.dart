import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_cim_plus/constant/enums.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/utils/database_helper.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  ChatDetailController();

  RxString rxTitle = ''.obs;
  final messages = <types.Message>[].obs;
  Rx<types.User> target = Rx<types.User>(
    types.User(
      id: Get.parameters['id'] ?? '',
      imageUrl: Get.parameters['avatar'] ?? '',
    ),
  );

  int page = 1;
  int size = 20;

  @override
  void onInit() {
    super.onInit();
    rxTitle.value = Get.parameters['title'] ?? '';
    LogI('title is : ${rxTitle.value}');
    // 初始化当前用户的聊天记录
    getConversion();
  }

  Future<void> getConversion() async {
    List<ChatRecord> records = await DatabaseHelper()
        .getConversionList(page, size, int.parse(target.value.id));
    records.forEach((item) {
      LogI('获取消息：${item.content}');
      // messages.add(types.Message(author: ))
    });
  }

  Future<void> sendMsg(types.PartialText msg) async {
    ChatRecord record = ChatRecord(
      avatar: target.value.imageUrl,
      targetId: int.parse(target.value.id),
      targetName: rxTitle.value,
      content: msg.text,
      msgType: MsgType.txtMsg.code,
      chatType: ChatType.p2p.code,
      createTime: DateTime.now().second,
      logicType: LogicType.normal.code,
    );
    await DatabaseHelper().insertRecord(record);
    // 插入成功，并获取最新用户的数据
  }
}
