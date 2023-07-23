import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/http/apiservice/api_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FriendRequest extends StatefulWidget {
  const FriendRequest({Key? key}) : super(key: key);

  @override
  State<FriendRequest> createState() => _FriendRequestState();
}

class _FriendRequestState extends State<FriendRequest> {
  final _formKey = GlobalKey<FormState>();
  String targetId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加好友/加群'),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text('查找'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ApiService().queryNewFriend(targetId);
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "好友手机号或群id",
                    disabledBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      Fluttertoast.showToast(msg: '手机号或群号不能为空');
                      return '';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => targetId = value!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
