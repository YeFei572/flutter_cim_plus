import 'package:flutter/material.dart';
import 'package:flutter_cim_plus/store/user_store.dart';
import 'package:flutter_cim_plus/view/mine/mine_controller.dart';
import 'package:flutter_cim_plus/widget/net_image_cached.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<MineController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                netImageCached(
                  UserStore.to.info.avatar,
                  width: 100.w,
                  height: 100.w,
                ),
                SizedBox(width: 20.w),
                Text(UserStore.to.info.nickname)
                // Column(
                //   children: [
                // Text(controller.rxInfo!.value.nickname),
                // controller.rxInfo!.value.gender == 1
                //     ? const Icon(
                //         Icons.person,
                //         color: Colors.blue,
                //       )
                //     : const Icon(
                //         Icons.person,
                //         color: Colors.pink,
                //       ),
                //   ],
                // )
              ],
            ),
          );
        }),
      ),
    );
  }
}
