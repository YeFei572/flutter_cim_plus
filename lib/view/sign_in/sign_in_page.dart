import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/view/sign_in/sign_in_controller.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      builder: (ctrl) => FlutterLogin(
          hideForgotPasswordButton: true,
          title: ctrl.title,
          userType: LoginUserType.phone,
          logo: const AssetImage('assets/images/ecrop.png'),
          userValidator: (username) => ctrl.validate(username),
          onLogin: (data) => ctrl.login(data),
          onRecoverPassword: (str) => ctrl.recoverPwd(str)),
    );
  }
}
