import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle? titleS({
    double size = 17,
    FontWeight fWeight = FontWeight.w600,
  }) {
    return TextStyle(fontSize: size, fontWeight: fWeight);
  }

  static TextStyle? contentS({
    double size = 13,
    FontWeight fWeight = FontWeight.w400,
    Color? color,
  }) {
    return TextStyle(fontSize: size, fontWeight: fWeight, color: color);
  }
}
