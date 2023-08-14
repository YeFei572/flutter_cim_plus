import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_cim_plus/http/apiservice/api_service.dart';
import 'package:flutter_cim_plus/model/base_entity.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:get/get.dart';

import '../../model/friend_info.dart';
import '../chat/detail/chat_view.dart';

class FriendController extends GetxController {
  FriendController();

  final friendList = <FriendInfo>[].obs;
  EasyRefreshController refreshController = EasyRefreshController();

  @override
  void onInit() {
    LogI("初始化朋友");
    // 初始化好友列表
    initFriendData();
    super.onInit();
  }

  Future<void> initFriendData() async {
    BaseEntity<List<FriendInfo>> res = await ApiService().getMyFriends();
    if (res.code == 0 && res.data != null && res.data!.isNotEmpty) {
      friendList.value = res.data!;
    }
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> toDetail(FriendInfo info) async {
    Get.to(
      () => ChatView(
        id: info.userId.toString(),
        avatar: info.avatar ?? '',
        title: info.nickname ?? '',
      ),
    );
  }
}
