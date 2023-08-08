// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRecord _$ChatRecordFromJson(Map<String, dynamic> json) => ChatRecord(
      id: json['id'] as int?,
      targetId: json['targetId'] as int?,
      targetName: json['targetName'] as String?,
      fromId: json['fromId'] as int?,
      fromName: json['fromName'] as String?,
      fromAvatar: json['fromAvatar'] as String?,
      avatar: json['avatar'] as String?,
      content: json['content'] as String?,
      msgType: json['msgType'] as int?,
      chatType: json['chatType'] as int?,
      createTime: json['createTime'] as int?,
      logicType: json['logicType'] as int?,
    );

Map<String, dynamic> _$ChatRecordToJson(ChatRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetId': instance.targetId,
      'targetName': instance.targetName,
      'avatar': instance.avatar,
      'fromId': instance.fromId,
      'fromName': instance.fromName,
      'fromAvatar': instance.fromAvatar,
      'content': instance.content,
      'msgType': instance.msgType,
      'createTime': instance.createTime,
      'chatType': instance.chatType,
      'logicType': instance.logicType,
    };
