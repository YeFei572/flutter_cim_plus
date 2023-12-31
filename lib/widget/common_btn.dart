import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBtn extends StatefulWidget {
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final String? icon;
  final double? iconSize;
  final double? borderRadius;
  final double? width;
  final double? height;
  final bool enable;

  const CommonBtn({
    Key? key,
    required this.text,
    this.width,
    this.height,
    required this.onTap,
    this.textStyle,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.iconSize,
    this.borderRadius,
    this.enable = true,
  }) : super(key: key);

  @override
  State<CommonBtn> createState() => _CommonBtnState();
}

class _CommonBtnState extends State<CommonBtn> {
  ///防止重复点击
  static const int CLICK_TIME = 200;

  int _lastClickTime = 0;
  bool _isPan = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var dateTimeNowMilli = DateTime.now().millisecond;
        if (dateTimeNowMilli - _lastClickTime > CLICK_TIME) {
          _lastClickTime = dateTimeNowMilli;
          if (widget.enable) widget.onTap?.call();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Opacity(
        opacity: _isPan && widget.enable ? 0.8 : 1,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                (widget.enable ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.w),
          ),
          width: widget.width ?? 120.w,
          height: widget.height ?? 70.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: Image.asset(
                      widget.icon!,
                      width: widget.iconSize,
                      height: widget.iconSize,
                    )),
              Text(
                widget.text!,
                style: widget.textStyle ??
                    TextStyle(
                        color: (widget.enable
                            ? const Color(0xffffffff)
                            : const Color(0xff999999)),
                        fontSize: 32.sp),
              )
            ],
          ),
        ),
      ),
      onPanDown: (DragDownDetails details) {
        setState(() {
          _isPan = true;
        });
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          _isPan = false;
        });
      },
      onPanCancel: () {
        setState(() {
          _isPan = false;
        });
      },
    );
  }
}
