// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as num?,
      phone: json['phone'] as String?,
      token: json['token'] as String?,
      nickname: json['nickname'] as String? ?? '',
      gender: json['gender'] as int?,
      avatar: json['avatar'] as String? ?? '',
      remark: json['remark'] as String?,
      routeInfo: json['routeInfo'] == null
          ? null
          : RouteInfo.fromJson(json['routeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'token': instance.token,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'remark': instance.remark,
      'routeInfo': instance.routeInfo,
    };
