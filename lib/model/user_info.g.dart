// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['id'] as num,
      json['phone'] as String,
      json['token'] as String,
      json['nickname'] as String,
      json['gender'] as int,
      json['remark'] as String?,
      json['routeInfo'] == null
          ? null
          : RouteInfo.fromJson(json['routeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'token': instance.token,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'remark': instance.remark,
      'routeInfo': instance.routeInfo,
    };
