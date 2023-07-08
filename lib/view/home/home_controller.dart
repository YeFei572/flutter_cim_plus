import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../style/color.dart';

class HomeController extends GetxController {
  HomeController();

  /// 成员变量
  late final List<String> tabTitles;
  late DateTime? lastPopTime = DateTime.now();

  RxInt page = 0.obs;

  /// 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件
  /// tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int index) {
    page.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // 初始静态数据
    tabTitles = ['聊天', '好友', '发现', '我的'];
    bottomTabs = <BottomNavigationBarItem>[
      _buildBottomNavigationBarItem(Icons.message_rounded, tabTitles[0]),
      _buildBottomNavigationBarItem(Icons.people, tabTitles[1]),
      _buildBottomNavigationBarItem(Icons.discord, tabTitles[2]),
      _buildBottomNavigationBarItem(Icons.person, tabTitles[3]),
    ];
    pageController = PageController(initialPage: page.value);
  }

  Future<bool> exit() async {
    // 点击返回键的操作
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime!) > const Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      Fluttertoast.showToast(msg: '再按一次退出');
      return false;
    } else {
      lastPopTime = DateTime.now();
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    return true;
  }

  _buildBottomNavigationBarItem(IconData iconfont, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconfont,
        color: AppColor.primaryText,
        size: 20.w,
      ),
      activeIcon: Icon(
        iconfont,
        color: AppColor.secondaryColor,
        size: 20.w,
      ),
      label: label,
      backgroundColor: AppColor.accentColor,
    );
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
