import 'package:flutter/material.dart';

class MediaQueryUtil {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}
