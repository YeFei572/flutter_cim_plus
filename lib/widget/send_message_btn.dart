import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/style/txt_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_btn.dart';

class SendMessageBtn extends StatefulWidget {
  final TextEditingController textController;
  final Function sendMsg;
  const SendMessageBtn(
      {required this.textController, required this.sendMsg, Key? key})
      : super(key: key);

  @override
  State<SendMessageBtn> createState() => _SendMessageBtnState();
}

class _SendMessageBtnState extends State<SendMessageBtn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bezier; //透明度渐变
  bool forward = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this); //初始化，动画控制器,每个动画都是执行2秒
    bezier = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 1.0, curve: Curves.ease),
    ));
    widget.textController.addListener(() {
      if (widget.textController.text.trim().isNotEmpty) {
        if (!forward) {
          controller.forward(); //开始
          forward = true;
        }
      } else {
        if (forward) {
          controller.reverse(); //开始
          forward = false;
        }
      }
    });
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: bezier.value,
      child: GestureDetector(
        onTap: () => widget.sendMsg(),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10.w),
          ),
          width: 60.w * bezier.value,
          height: 40.w * bezier.value,
          child: const Text('Send'),
        ),
      ),
    );
  }
}
