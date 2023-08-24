import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/store/chat_store.dart';
import 'package:flutter_cim_plus/store/user_store.dart';
import 'package:flutter_cim_plus/utils/log_utils.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../constant/enums.dart';
import '../../../model/chat_record.dart';
import '../../../model/user_info.dart';
import '../../../utils/database_helper.dart';
import '../../../widget/message_item.dart';

class ChatView extends StatefulWidget {
  final String id;
  final String avatar;
  final String title;

  const ChatView(
      {required this.id, required this.avatar, required this.title, Key? key})
      : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  int page = 1;
  int size = 50;
  ScrollController scrollController = ScrollController();
  late ListObserverController observerController;
  late ChatScrollObserver chatObserver;
  List<ChatRecord> records = [];
  TextEditingController editViewController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// todo 加载历史聊天记录
    _refreshMsg();

    /// 初始化各种属性
    scrollController.addListener(() {
      if (scrollController.offset < 50) {
        // todo 是否需要更新未读记录
      }
    });

    observerController = ListObserverController(controller: scrollController)
      ..cacheJumpIndexOffset = false;
    chatObserver = ChatScrollObserver(observerController)
      ..fixedPositionOffset = 5
      ..toRebuildScrollViewCallback = () {
        setState(() {});
      }
      ..onHandlePositionResultCallback = (result) {};
  }

  @override
  void dispose() {
    observerController.controller?.dispose();
    editViewController.dispose();
    super.dispose();
  }

  _sendMsg() async {
    if (editViewController.text.isEmpty) {
      return;
    }
    UserInfo me = UserStore.to.info;
    LogI(editViewController.text);
    ChatRecord record = ChatRecord(
      avatar: widget.avatar,
      targetId: int.parse(widget.id),
      targetName: widget.title,
      content: editViewController.text,
      fromId: int.tryParse(me.id.toString()),
      fromName: me.nickname,
      fromAvatar: me.avatar,
      msgType: MsgType.txtMsg.code,
      chatType: ChatType.p2p.code,
      createTime: DateTime.now().millisecondsSinceEpoch,
      logicType: LogicType.friend.code,
    );
    chatObserver.standby(changeCount: 1);
    setState(() {
      records = [record, ...records];
    });
    ChatStore.to.sendMsg(record);
    editViewController.clear();
  }

  _loadMsg() async {
    debugPrint("---loadMsg----");
  }

  _refreshMsg() async {
    debugPrint("开始加载本地历史消息....");
    page = 1;
    List<ChatRecord> res = await DatabaseHelper()
        .getConversionList(page, size, int.parse(widget.id));
    chatObserver.standby(changeCount: res.length);
    setState(() => records = res);
  }

  _cleanMsg() async {
    await DatabaseHelper().cleanMsg(int.parse(widget.id));
    _refreshMsg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3c3f41),
      appBar: AppBar(
        backgroundColor: const Color(0xff2b2b2b),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.clean_hands),
            onPressed: () => _cleanMsg(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildInputWidget(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    /// 获取当前用户的id
    String currentId = UserStore.to.info.id.toString();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Widget resultWidget = EasyRefresh.builder(
        header: const CupertinoHeader(),
        footer: const CupertinoFooter(
          position: IndicatorPosition.above,
          infiniteOffset: null,
        ),
        onLoad: () => _loadMsg(),
        onRefresh: () => _refreshMsg(),
        childBuilder: (context, physics) {
          // 新增的代码
          var listViewPhysics =
              physics.applyTo(ChatObserverClampingScrollPhysics(
            observer: chatObserver,
          ));
          if (chatObserver.isShrinkWrap) {
            listViewPhysics =
                const NeverScrollableScrollPhysics().applyTo(listViewPhysics);
          }
          Widget resultWidget1 = ListView.builder(
            physics: listViewPhysics,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            shrinkWrap: chatObserver.isShrinkWrap,
            reverse: true,
            controller: scrollController,
            itemBuilder: (context, index) {
              return MessageItem(
                chatRecord: records[index],
                isOwn: currentId == records[index].fromId.toString(),
              );
            },
            itemCount: records.length,
          );
          if (chatObserver.isShrinkWrap) {
            resultWidget1 = SingleChildScrollView(
              reverse: true,
              physics: physics,
              child: Container(
                alignment: Alignment.topCenter,
                height: constraints.maxHeight + 0.001,
                child: resultWidget1,
              ),
            );
          }
          return resultWidget1;
        },
      );
      return Align(
        alignment: Alignment.topCenter,
        child: ListViewObserver(
          controller: observerController,
          child: resultWidget,
        ),
      );
    });
  }

  Widget _buildInputWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: Color(0xff2b2b2b),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4),
          topLeft: Radius.circular(4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              minLines: 1,
              showCursor: true,
              controller: editViewController,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 24,
            color: Colors.white,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightForFinite(),
            onPressed: _sendMsg,
          )
        ],
      ),
    );
  }
}
