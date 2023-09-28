import 'dart:async';
import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cim_plus/model/chat_record.dart';
import 'package:flutter_cim_plus/proto/RequestProto.pb.dart';
import 'package:flutter_cim_plus/route/names.dart';
import 'package:flutter_cim_plus/store/chat_store.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../constant/enums.dart';
import '../../model/user_info.dart';
import '../../style/color.dart';
import '../../utils/encodec_utils.dart';

class HomeController extends GetxController {
  /// 成员变量
  late final List<String> tabTitles;
  late DateTime? lastPopTime = DateTime.now();

  // 关于socket的常量
  late Socket socket;
  bool isConnected = false;
  final heartbeatInterval = 5000;
  RxInt page = 0.obs;
  Timer? heartbeatTimer;

  /// 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件
  /// tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int index) {
    page.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // 初始静态数据
    tabTitles = ['聊天', '好友', '发现', '我的'];
    bottomTabs = <BottomNavigationBarItem>[
      _buildBottomNavigationBarItem(Icons.message_rounded, tabTitles[0]),
      _buildBottomNavigationBarItem(Icons.people, tabTitles[1]),
      _buildBottomNavigationBarItem(Icons.discord, tabTitles[2]),
      _buildBottomNavigationBarItem(Icons.person, tabTitles[3]),
    ];
    pageController = PageController(initialPage: page.value);
    // 初始化socket的信息
    initSocket();
    // 初始化会话store
    Get.put<ChatStore>(ChatStore());
  }

  Future<void> initSocket() async {
    UserInfo? info = await StoreUtil.loadInfo();
    if (null == info || info.routeInfo == null) {
      Fluttertoast.showToast(msg: '登录失效，请重新登录！');
      Get.offAndToNamed(AppRoutes.login);
      return;
    }
    try {
      socket = await Socket.connect(
          info.routeInfo?.ip, info.routeInfo!.serverPort ?? 17592);
      LogD('准备发起socket链接并进行鉴权');
      sendMsg(info.id ?? 0, info.token ?? '', MsgType.loginMsg);
      socket.listen(
        (event) {
          Uint8List list = decodeProtocBufferData(event);
          BaseRequestProto proto = BaseRequestProto.fromBuffer(list);
          if (MsgType.loginMsg.code == proto.type) {
            if (LoginState.success.code == proto.msgCode) {
              // 设置连接状态为已连接
              isConnected = true;
              Fluttertoast.showToast(msg: proto.reqMsg);
            } else if (LoginState.nonAuth.code == proto.msgCode) {
              Fluttertoast.showToast(msg: proto.reqMsg);
              Get.offAndToNamed(AppRoutes.login);
            } else {
              Fluttertoast.showToast(msg: proto.reqMsg.toString());
            }
          } else if (MsgType.heartbeat.code == proto.type) {
            if (proto.reqMsg.toString() != 'PONG') {
              Fluttertoast.showToast(msg: '检测连接已经断开啦,请尝试重新登录！');
            }
          } else {
            Fluttertoast.showToast(msg: proto.reqMsg);
            int uid = proto.fromId.toInt() == info.id!.toInt()
                ? proto.receiveId.toInt()
                : proto.fromId.toInt();
            ChatRecord record = ChatRecord(
              uid: uid,
              targetId: info.id!.toInt(),
              targetName: info.nickname,
              fromId: proto.fromId.toInt(),
              fromName: '',
              fromAvatar: '',
              avatar: info.avatar,
              content: proto.reqMsg,
              msgType: proto.type,
              createTime: DateTime.now().millisecondsSinceEpoch,
              chatType: proto.chatType,
              logicType: LogicType.friend.code,
            );
            ChatStore.to.receiveMsg(record);
            LogI(
                '收到：${proto.reqMsg} ${proto.msgCode} ${proto.type} ${proto.fromId} ${proto.receiveId}');
          }
        },
        onError: (error) {
          Fluttertoast.showToast(msg: '发起连接失败，请联系客服！');
        },
        onDone: () {
          disconnect();
        },
      );
      // 启动心跳定时器
      startHeartbeat();
    } catch (e) {
      debugPrint('发起连接失败：$e');
    }
  }

  /// 心跳方法
  void startHeartbeat() {
    // 创建定时器
    heartbeatTimer =
        Timer.periodic(Duration(milliseconds: heartbeatInterval), (timer) {
      if (isConnected) {
        sendHeartbeat();
      } else {
        stopHeartbeat();
      }
    });
  }

  /// 开始发送心跳
  void sendHeartbeat() async {
    UserInfo? info = await StoreUtil.loadInfo();
    if (null == info || info.routeInfo == null) {
      Fluttertoast.showToast(msg: '登录失效，请重新登录！');
      Get.offAndToNamed(AppRoutes.login);
      return;
    }
    if (socket != null) {
      sendMsg(info.id ?? 0, info.token ?? '', MsgType.heartbeat);
    }
  }

  /// 停止心跳
  void stopHeartbeat() {
    if (heartbeatTimer != null && heartbeatTimer!.isActive) {
      heartbeatTimer!.cancel();
      heartbeatTimer = null;
    }
  }

  void disconnect() {
    if (null != socket) {
      socket.destroy();
      socket.close();
      isConnected = false;
    }
  }

  /// 向服务器发送消息
  void sendMsg(num currentUserId, String message, MsgType msgType) {
    // 准备消息参数
    BaseRequestProto req = BaseRequestProto.create();
    req.fromId = Int64(currentUserId.toInt());
    req.type = msgType.code;
    req.reqMsg = message;
    // 发送消息
    Uint8List buff = req.writeToBuffer();
    socket.add(getProtocBufferData(buff));
  }

  Future<bool> exit() async {
    // 点击返回键的操作
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime!) > const Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      Fluttertoast.showToast(msg: '再按一次退出');
      return false;
    } else {
      lastPopTime = DateTime.now();
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    return true;
  }

  _buildBottomNavigationBarItem(IconData iconFont, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconFont,
        color: AppColor.primaryText,
        size: 20.w,
      ),
      activeIcon: Icon(
        iconFont,
        color: AppColor.secondaryColor,
        size: 20.w,
      ),
      label: label,
      backgroundColor: AppColor.accentColor,
    );
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
