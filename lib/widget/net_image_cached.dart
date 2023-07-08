import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  double radius = 24,
  EdgeInsetsGeometry? margin,
  BoxFit fit = BoxFit.cover,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height.w,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.w),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageProvider,
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        width: width.w,
        height: height.h,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(radius.w)),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
