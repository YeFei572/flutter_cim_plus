import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/route/names.dart';
import 'package:flutter_cim_plus/view/chat/detail/chat_detail_bindings.dart';
import 'package:flutter_cim_plus/view/chat/detail/chat_detail_page.dart';
import 'package:flutter_cim_plus/view/discover/discover_page.dart';
import 'package:flutter_cim_plus/view/home/home_bindings.dart';
import 'package:flutter_cim_plus/view/home/home_page.dart';
import 'package:flutter_cim_plus/view/mine/mine_bindings.dart';
import 'package:flutter_cim_plus/view/mine/mine_page.dart';
import 'package:get/get.dart';

import '../middlewares/middlewares.dart';
import '../view/chat/chat_bindings.dart';
import '../view/chat/chat_page.dart';
import '../view/discover/discover_bindings.dart';
import '../view/friend/friend_bindings.dart';
import '../view/friend/friend_page.dart';
import '../view/sign_in/sign_in_bindings.dart';
import '../view/sign_in/sign_in_page.dart';
import '../view/welcome/welcome_bindings.dart';
import '../view/welcome/welcome_page.dart';
import 'observers.dart';

class AppPages {
  static const initial = AppRoutes.initial;

  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(),
      ],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBindings(),
    ),
    GetPage(
      name: AppRoutes.friend,
      page: () => const FriendPage(),
      binding: FriendBindings(),
    ),
    GetPage(
      name: AppRoutes.discover,
      page: () => const DiscoverPage(),
      binding: DiscoverBindings(),
    ),
    GetPage(
      name: AppRoutes.mine,
      page: () => const MinePage(),
      binding: MineBindings(),
    ),
    GetPage(
      name: AppRoutes.chatDetail,
      page: () => const ChatDetailPage(),
      binding: ChatDetailBindings(),
    ),
  ];
}
