import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../style/color.dart';

class HomeController extends GetxController {
  HomeController();

  /// 成员变量
  late final List<String> tabTitles;

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
    tabTitles = ['好友', '发现', '我的'];
    bottomTabs = <BottomNavigationBarItem>[
      _buildBottomNavigationBarItem(Icons.people, tabTitles[0]),
      _buildBottomNavigationBarItem(Icons.discord, tabTitles[1]),
      _buildBottomNavigationBarItem(Icons.person, tabTitles[2]),
    ];
    pageController = PageController(initialPage: page.value);
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
