import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_fonts.dart';
import '../../../core/const_data/app_image.dart';

Widget buildPromotionalStack() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 355,
        height: 105,
        margin: const EdgeInsets.only(left: 10, top: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 4)],
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Summer Sale', style: TextStyle(fontSize: 14, fontFamily: AppFonts.ralewayRegular, color: AppColor.black)),
              Text('15% OFF', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, fontFamily: AppFonts.futura, color: AppColor.purble)),
            ],
          ),
        ),
      ),
      Positioned(top: 10, right: 14, child: buildImageContainer(AppImage.tshirt)),
      ..._buildIconPositions(),
    ],
  );
}

List<Widget> _buildIconPositions() {
  return [
    Positioned(top: 30, left: 200, child: SvgPicture.asset(AppImage.newicon, height: 25.84, width: 25.96)),
    Positioned(top: 10, left: 135, child: SvgPicture.asset(AppImage.star, height: 25.84, width: 25.96)),
    Positioned(top: 20, left: 340, child: SvgPicture.asset(AppImage.star, height: 25.84, width: 25.96)),
    Positioned(bottom: 10, left: 160, child: SvgPicture.asset(AppImage.star, height: 25.84, width: 25.96)),
    Positioned(bottom: 20, left: 13, child: SvgPicture.asset(AppImage.star, height: 25.84, width: 25.96)),
  ];
}

Widget buildImageContainer(String imagePath) {
  return Transform.rotate(
    angle: 16.88 * (3.14159 / 180),
    child: Container(
      width: 99,
      height: 99,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 4), blurRadius: 4)],
      ),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    ),
  );
}
