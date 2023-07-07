// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendInfo _$FriendInfoFromJson(Map<String, dynamic> json) => FriendInfo(
      userId: json['userId'] as int?,
      nickname: json['nickname'] as String?,
      remark: json['remark'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$FriendInfoToJson(FriendInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'remark': instance.remark,
      'avatar': instance.avatar,
    };
