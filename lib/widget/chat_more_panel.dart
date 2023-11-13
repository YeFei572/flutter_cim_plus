import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class ChatMorePanel extends StatelessWidget {
  const ChatMorePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeeeeee),
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildItem(context, 'ic_details_photo', '相册', 0),
                _buildItem(context, 'ic_details_camera', '相机', 1),
                _buildItem(context, 'ic_details_localtion', '位置', 2),
                _buildItem(context, 'ic_details_red', '红包', 3),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _buildItem(context, 'ic_details_file', '文件', 4),
                _buildItem(context, 'ic_details_favorite', '收藏', 5),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(BuildContext context, String icon, String lable, int type) {
    return Expanded(
        child: Center(
      child: GestureDetector(
        onTap: () async {
          switch (type) {
            case 0:

              ///相册
              // final List<AssetEntity>? result = await AssetPicker.pickAssets(
              //     context,
              //     pickerConfig: const AssetPickerConfig(
              //         maxAssets: 1, requestType: RequestType.common));
              // if (result?.isNotEmpty ?? false) {
              //   File file = (await result!.first.originFile)!;
              //   if (file.filename.endsWith('mp4')) {
              //     _chatController.sendVideo(file);
              //   } else {
              //     _chatController.sendImage(file);
              //   }
              // }
              break;
            case 1:

              ///拍摄
              // final AssetEntity? entity = await CameraPicker.pickFromCamera(
              //     context,
              //     pickerConfig: const CameraPickerConfig(
              //         enableRecording: true,
              //         resolutionPreset: ResolutionPreset.high));
              // if (entity != null) {
              //   var file = await entity.file;
              //   if (file != null) {
              //     if (file.filename.endsWith('mp4')) {
              //       _chatController.sendVideo(file);
              //     } else {
              //       _chatController.sendImage(file);
              //     }
              //   }
              // }
              break;
            case 2:

              ///位置
              // var poi =
              //     await NavigatorUtils.toNamed(SelectLocationPage.routeName);
              // if (poi != null) {
              //   _chatController.sendLocation(poi);
              // }
              break;
            case 3:

              ///红包
              // NavigatorUtils.toNamed(SendRedPacketPage.routeName,
              //     arguments: _chatController.conversation);
              break;
            case 4:

              ///文件
              // FilePickerResult? result = await FilePicker.platform.pickFiles();
              // if (result?.files.isNotEmpty ?? false) {
              //   _chatController.sendFile(File(result!.files.first.path!));
              // }
              break;
            case 5:

              ///收藏
              break;
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.w),
              ),
              width: 70.w,
              height: 70.w,
              child: Center(
                child: Image.asset(
                  Utils.getImgPath(icon,
                      dir: Utils.DIR_CHAT, format: Utils.WEBP),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              lable,
              style: TextStyle(color: const Color(0xff999999), fontSize: 14.sp),
            )
          ],
        ),
      ),
    ));
  }
}
