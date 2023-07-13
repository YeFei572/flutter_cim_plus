/// 消息类型
enum MsgType {
  loginMsg(1, '登录消息'),
  txtMsg(2, '文本'),
  picMsg(3, '图片'),
  fileMsg(4, '文件'),
  voiceMsg(5, '音频'),
  videoMsg(6, '视频'),
  ;

  final int code;
  final String msg;

  const MsgType(this.code, this.msg);
}

/// 消息的逻辑类型
enum LogicType {
  friend(1, '单个用户的内部聊天记录'),
  normal(2, '会话记录');

  final int code;
  final String msg;

  const LogicType(this.code, this.msg);
}
