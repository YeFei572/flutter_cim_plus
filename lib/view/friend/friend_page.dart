import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/widget/net_image_cached.dart';
import 'package:get/get.dart';

import '../../model/friend_info.dart';
import 'friend_controller.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('好友'),
        centerTitle: true,
      ),
      body: GetX<FriendController>(
        builder: (controller) => EasyRefresh(
          onRefresh: controller.initFriendData,
          child: ListView.separated(
            itemBuilder: (item, index) {
              FriendInfo info = controller.friendList[index];
              return ListTile(
                leading: netImageCached(info.avatar!),
                title: Text(info.remark ??= info.nickname ?? ''),
              );
            },
            separatorBuilder: (_, index) => const Divider(),
            itemCount: controller.friendList.length,
          ),
        ),
      ),
    );
  }

// _buildFriendList() {
//   // return Obx(() => Text(controller.friendList.length.toString()));
//   return GetBuilder(builder: (controller) => Text(controller.f));
// }
}
