import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/view/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) => const Scaffold());
  }
}
