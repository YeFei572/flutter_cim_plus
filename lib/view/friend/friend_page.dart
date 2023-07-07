import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: EasyRefresh(
        onRefresh: () => {},
        child: Obx(() => Text(controller.friendList.length.toString())),
      ),
    );
  }

// _buildFriendList() {
//   // return Obx(() => Text(controller.friendList.length.toString()));
//   return GetBuilder(builder: (controller) => Text(controller.f));
// }
}
