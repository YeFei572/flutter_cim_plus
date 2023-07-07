import 'package:flutter_cim_plus/view/chat/chat_controller.dart';
import 'package:flutter_cim_plus/view/discover/discover_controller.dart';
import 'package:flutter_cim_plus/view/friend/friend_controller.dart';
import 'package:flutter_cim_plus/view/mine/mine_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    /// 此处需要统一放入所有的controller，因为这个controller是在一个页面进行加载，没有路由动作，如果不放入，则会找不到对应的controller
    /// 需要注意的是，所有的controller如果需要绑定，则需要在路由变更的时候才会触发！！！
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<FriendController>(() => FriendController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<MineController>(() => MineController());
  }
}
