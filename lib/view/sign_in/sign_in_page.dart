import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/view/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text('登录页')],
        ),
      ),
    );
  }
}
