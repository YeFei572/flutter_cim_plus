import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cim_plus/ext/widget_ext.dart';
import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/emoji_text.dart';
import '../utils/utils.dart';
import 'chat_more_panel.dart';
import 'emoji_grid_view.dart';
import 'input_field.dart';
import 'send_message_btn.dart';

class ChatInputWidget extends StatefulWidget {
  final TextEditingController inputController;
  final Function onPressed;
  const ChatInputWidget(
      {required this.inputController, required this.onPressed, super.key});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget>
    with WidgetsBindingObserver {
  static const int INPUT_TYPE_NULL = 0;
  static const int INPUT_TYPE_EMOJI = 1;
  static const int INPUT_TYPE_AUDIO = 2;
  static const int INPUT_TYPE_MORE = 3;
  final FocusNode focusNode = FocusNode();

  double _keyboardHeight = 0;

  //是否键盘弹出
  bool isKeyboard = false;
  bool autoShowKeyboard = false;
  int inputType = INPUT_TYPE_NULL;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _keyboardHeight = StoreUtil.store.read('keyboardHeight') ?? 175.w;
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (!(ModalRoute.of(context)?.isCurrent ?? true)) {
          if (isKeyboard) {
            onKeyboardHeight(0);
            FocusScope.of(context).requestFocus(FocusNode());
          }
          return;
        }
        final bottom = MediaQuery.of(context).viewInsets.bottom;
        onKeyboardHeight(bottom);
      }
    });
  }

  void onKeyboardHeight(double height) {
    // debugPrint("onKeyboardHeight $isKeyboard $height $_keyboardHeight");
    if (height == 0) {
      //关闭键盘
      if (isKeyboard) {
        setState(() {
          isKeyboard = false;
        });
      }
    } else {
      if (height < _keyboardHeight) {
        return;
      }
      autoShowKeyboard = false;
      _keyboardHeight = height;
      setState(() {
        inputType = INPUT_TYPE_NULL;
        isKeyboard = true;
      });
      StoreUtil.store.write('keyboardHeight', _keyboardHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInputLayout(),
        _buildBottomPanel(),
      ],
    );
  }

  _buildInputMore() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(Icons.add, size: 24.sp, color: Colors.black),
          ),
          onTap: () {
            setState(() {
              debugPrint('inputType: $inputType');
              if (INPUT_TYPE_MORE == inputType) {
                inputType = INPUT_TYPE_NULL;
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => focusNode.showkeyboard());
                autoShowKeyboard = true;
              } else {
                inputType = INPUT_TYPE_MORE;
                if (isKeyboard) {
                  SystemChannels.textInput
                      .invokeMethod<void>('TextInput.hide')
                      .whenComplete(() {});
                }
                if (inputType != INPUT_TYPE_EMOJI) {
                  focusNode.unfocus();
                }
              }
            });
          },
        ),
        SendMessageBtn(
          sendMsg: () => widget.onPressed(),
          textController: widget.inputController,
        )
      ],
    );
  }

  _buildInputType() {
    return GestureDetector(
      onTap: () {
        _clickInputBtn(INPUT_TYPE_AUDIO);
      },
      child: Image.asset(
        Utils.getImgPath(
            inputType == INPUT_TYPE_AUDIO ? 'ic_keyboard' : 'ic_voice',
            dir: Utils.DIR_CHAT,
            format: Utils.WEBP),
        width: 38.w,
        height: 38.w,
        color: Colors.black,
        fit: BoxFit.fill,
      ),
    );
  }

  _buildInputLayout() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: Row(
          children: [
            _buildInputType(),
            SizedBox(width: 5.w),
            Expanded(
              child: inputType == INPUT_TYPE_AUDIO
                  ? Container(height: 38.w, color: Colors.pink)
                  // ? const PressRecordWidget()
                  : InputField(
                      autofocus: false,
                      focusNode: focusNode,
                      controller: widget.inputController,
                      extended: true,
                    ),
            ),
            SizedBox(width: 5.w),
            _buildInputEmoji(),
            SizedBox(width: 5.w),
            _buildInputMore()
          ],
        ),
      );

  _buildInputEmoji() {
    return GestureDetector(
      onTap: () {
        _clickInputBtn(INPUT_TYPE_EMOJI);
      },
      child: Image.asset(
        Utils.getImgPath('ic_emotion', dir: Utils.DIR_CHAT, format: Utils.WEBP),
        width: 38.w,
        height: 38.w,
        color: Colors.black,
        fit: BoxFit.fill,
      ),
    );
  }

  _clickInputBtn(int type) {
    setState(() {
      if (inputType == type) {
        inputType = INPUT_TYPE_NULL;
        WidgetsBinding.instance
            .addPostFrameCallback((_) => focusNode.showkeyboard());
        autoShowKeyboard = true;
      } else {
        inputType = type;
        if (isKeyboard) {
          _hidekeyboard();
        }
        if (type != INPUT_TYPE_EMOJI) {
          focusNode.unfocus();
        }
      }
    });
  }

  _hidekeyboard() {
    SystemChannels.textInput
        .invokeMethod<void>('TextInput.hide')
        .whenComplete(() {});
  }

  _buildBottomPanel() {
    // debugPrint('_buildBottomPanel $isKeyboard $inputType ');
    if ((!isKeyboard && inputType == INPUT_TYPE_NULL && !autoShowKeyboard) ||
        inputType == INPUT_TYPE_AUDIO) {
      return Container();
    }
    Widget? child;
    if (inputType == INPUT_TYPE_MORE) {
      child = const ChatMorePanel();
    } else if (inputType == INPUT_TYPE_EMOJI) {
      child = EmojiGridView(
        onTap: (EmojiModel emoji) {
          widget.inputController.insertText(emoji.tag!);
        },
      );
    }
    return SizedBox(
      height: _keyboardHeight,
      child: child,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
