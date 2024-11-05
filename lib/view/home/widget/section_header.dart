import 'package:flutter/material.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_fonts.dart';

Widget buildSectionHeader(String title, VoidCallback onSeeAllTap) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: AppFonts.ralewayRegular)),
        InkWell(
          onTap: onSeeAllTap,
          child: const Text('See all', style: TextStyle(fontSize: 14.0, color: AppColor.lightGreen, fontFamily: AppFonts.poppins)),
        ),
      ],
    ),
  );
}