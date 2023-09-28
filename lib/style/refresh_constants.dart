import 'package:easy_refresh/easy_refresh.dart';

class RefreshConstants {
  static ClassicHeader buildZhHeaders() {
    return const ClassicHeader(
      dragText: '下拉开始刷新',
      armedText: '松开开始刷新',
      readyText: '准备开始刷新',
      processedText: '刷新完成',
      processingText: '拼命加载中...',
      failedText: 'GG，刷新失败',
      messageText: '上次更新时间%T',
      noMoreText: '已经没有更多数据啦！',
    );
  }
}
