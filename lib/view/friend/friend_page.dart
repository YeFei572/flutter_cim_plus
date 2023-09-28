import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_cim_plus/style/refresh_constants.dart';
import 'package:flutter_cim_plus/widget/net_image_cached.dart';
import 'package:get/get.dart';

import '../../model/friend_info.dart';
import '../../route/route.dart';
import 'friend_controller.dart';
import 'request/friend_request.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('好友'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () => Get.offAndToNamed(AppRoutes.login),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const FriendRequest()),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: GetX<FriendController>(
        builder: (controller) => EasyRefresh(
          header: RefreshConstants.buildZhHeaders(),
          onRefresh: controller.refreshFriends,
          child: ListView.separated(
            itemBuilder: (item, index) {
              FriendInfo info = controller.friendList[index];
              return Bounce(
                duration: const Duration(milliseconds: 100),
                onPressed: () => controller.toDetail(info),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: netImageCached(info.avatar!),
                    title: Text(info.remark ??= info.nickname ?? ''),
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const Divider(),
            itemCount: controller.friendList.length,
          ),
        ),
      ),
    );
  }
}
