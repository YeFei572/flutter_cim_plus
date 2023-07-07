import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/view/chat/chat_page.dart';
import 'package:flutter_cim_plus/view/home/home_controller.dart';
import 'package:get/get.dart';

import '../discover/discover_page.dart';
import '../friend/friend_page.dart';
import '../mine/mine_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: const [
        ChatPage(),
        FriendPage(),
        DiscoverPage(),
        MinePage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.page.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
