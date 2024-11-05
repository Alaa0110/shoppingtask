import 'package:flutter/material.dart';

import '../../../core/const_data/app_fonts.dart';

Widget buildCategoryButton(String label) {
  return Container(
    width: 108,
    height: 40,
    margin: const EdgeInsets.only(right: 20),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.poppins,
        ),
      ),
    ),
  );
}