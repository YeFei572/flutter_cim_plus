import 'package:json_annotation/json_annotation.dart';

part 'chat_record.g.dart';

/// id:消息记录id
/// targetId：对象id，可以是用户id，群id
/// targetName: 对象名称，可以是用户名称，群名称
/// avatar： 头像
/// content：消息内容
/// msgType：消息类型
/// createTime：消息创建时间
/// chatType：记录类别，1表示私聊，2表示群聊
/// logicType: 逻辑类型，1表示普通聊天记录，2表示通话记录（chat页面的，每次只保留最新的一条记录）
@JsonSerializable(explicitToJson: true)
class ChatRecord {
  int? id;

  int? targetId;

  String? targetName;

  String? avatar;

  String? content;

  int? msgType;

  int? createTime;

  int? chatType;

  int? logicType;

  ChatRecord({
    this.id,
    this.targetId,
    this.targetName,
    this.avatar,
    this.content,
    this.msgType,
    this.chatType,
    this.createTime,
    this.logicType,
  });

  factory ChatRecord.fromJson(Map<String, dynamic> json) =>
      _$ChatRecordFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRecordToJson(this);
}
