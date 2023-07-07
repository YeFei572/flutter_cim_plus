import 'package:json_annotation/json_annotation.dart';

part 'friend_info.g.dart';

@JsonSerializable(explicitToJson: true)
class FriendInfo {
  int? userId;

  String? nickname;

  String? remark;

  String? avatar;

  FriendInfo({this.userId, this.nickname, this.remark, this.avatar});

  factory FriendInfo.fromJson(Map<String, dynamic> json) =>
      _$FriendInfoFromJson(json);

  Map<String, dynamic> toMap() => _$FriendInfoToJson(this);
}
