import 'package:get_storage/get_storage.dart';

import '../model/user_info.dart';

class StoreUtil {
  static final store = GetStorage();

  static Future<UserInfo> loadInfo() async {
    Map<String, dynamic> res = store.read('userInfo');
    if (null != res && null != res['routeInfo']) {
      return UserInfo.fromJson(res);
    } else {
      return Future.value(null);
    }
  }
}
