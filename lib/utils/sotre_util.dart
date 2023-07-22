import 'package:get_storage/get_storage.dart';

import '../model/user_info.dart';

class StoreUtil {
  static final store = GetStorage();

  static Future<UserInfo?> loadInfo() async {
    // Map<String, dynamic>? res = store.read('userInfo');
    dynamic temp = store.read('userInfo');
    if (null == temp) {
      return null;
    }
    if (temp is UserInfo?) {
      return temp;
    }
    if (temp is Map<String, dynamic> && null != temp['routeInfo']) {
      return UserInfo.fromJson(temp);
    } else {
      return null;
    }
  }
}
