import 'package:flutter/material.dart';

class SizeUtils {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double statusBarHeight;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    statusBarHeight = _mediaQueryData.padding.top;
  }
}
