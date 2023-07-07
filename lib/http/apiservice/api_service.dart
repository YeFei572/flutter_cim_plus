import 'package:dio/dio.dart';
import 'package:flutter_cim_plus/constant/constants.dart';
import 'package:flutter_cim_plus/http/dio_client.dart';
import 'package:flutter_cim_plus/model/user_info.dart';
import 'package:retrofit/http.dart';

import '../../model/base_entity.dart';
import '../../model/friend_info.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiService {
  factory ApiService({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST('/login')
  Future<BaseEntity<UserInfo>> login(@Body() Map<String, String> loginData);

  @GET('/friend/getMyFriends')
  Future<BaseEntity<List<FriendInfo>>> getMyFriends();
}
