import 'package:flutter_cim_plus/model/route_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  late num id;
  late String phone;
  late String token;
  late String nickname;
  late int gender;
  String? remark;
  RouteInfo? routeInfo;

  UserInfo(this.id, this.phone, this.token, this.nickname, this.gender,
      this.remark, this.routeInfo);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
