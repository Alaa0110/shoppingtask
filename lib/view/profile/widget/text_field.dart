
import 'package:flutter/material.dart';

import '../../../core/service/media_query.dart';

Widget buildTextField({
  required String hintText,
  required Function(String) onChanged,
  bool obscureText = false,
}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      width: MediaQueryUtil.screenWidth * 0.9,
      height: MediaQueryUtil.screenHeight * 0.07,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}