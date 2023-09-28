class TimeUtil {
  static String formatTimeAgo(int timestamp) {
    DateTime now = DateTime.now();
    DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    Duration difference = now.difference(targetTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} 天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} 小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} 分钟前';
    } else {
      return '刚刚';
    }
  }
}
