import 'package:flutter_cim_plus/http/http.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  late String title = 'CIM-PLUS';

  login(LoginData data) async {
    final Map<String, String> loginData = {
      'phone': data.name,
      'password': data.password
    };
    // await HttpUtil().post('/login', data: loginData).then((value) {
    //   debugPrint("登录接口：$value");
    //   Get.offNamed(AppRoutes.home);
    // });
    await DioUtils.instance.requestNetwork(Method.post, '/login').then((value) {
      print('value:::::$value');
    });
  }

  validate(name) {
    if (name.length < 4) {
      return '账户错误';
    }
  }
}
