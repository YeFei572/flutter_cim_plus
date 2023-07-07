import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_cim_plus/http/apiservice/api_service.dart';
import 'package:flutter_cim_plus/model/base_entity.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:get/get.dart';

import '../../model/friend_info.dart';

class FriendController extends GetxController {
  FriendController();

  RxList<FriendInfo> friendList = <FriendInfo>[].obs;
  EasyRefreshController refreshController = EasyRefreshController();

  @override
  void onInit() {
    // 初始化好友列表
    initFriendData;
    super.onInit();
  }

  Future<void> initFriendData() async {
    BaseEntity<List<FriendInfo>> res = await ApiService().getMyFriends();
    LogI(res.message ?? '');
  }
}
