import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/route/names.dart';
import 'package:flutter_cim_plus/view/home/home_bindings.dart';
import 'package:flutter_cim_plus/view/home/home_page.dart';
import 'package:get/get.dart';

import '../middlewares/middlewares.dart';
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
    )
  ];
}
