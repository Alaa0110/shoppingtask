import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppingtask/core/service/media_query.dart';
import '../core/const_data/app_colors.dart';
import 'bmb_custom_painter.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final Function()? onpressed1;
  final Function()? onpressed2;
  final Function()? onpressed3;
  final Function()? onpressed4;
  final Function()? onpressed5;
  final bool isSelectedHome;
  final bool isSelectedFavourite;

  BottomNavBar({
    this.onpressed1,
    this.onpressed2,
    this.onpressed3,
    this.onpressed4,
    this.onpressed5,
    this.isSelectedHome = false,
    this.isSelectedFavourite = false,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Container(color: Colors.transparent), // Transparent background
        ),
        // Custom painter background with fixed height of 106 as per Figma
        SizedBox(
          height:MediaQueryUtil.screenHeight * 0.13,
          child: CustomPaint(
            size: Size(screenWidth, MediaQueryUtil.screenHeight * 0.12),
            painter: BMBCustomPainter(),
          ),
        ),
        // Center Floating Action Button
        Positioned(
          top: MediaQueryUtil.screenHeight * 0.01, // Adjust for floating button alignment
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColor.lightGreen,
            child: const Icon(
              Ionicons.bag_handle_outline,
              color: AppColor.white,
            ),
            onPressed: () => Get.toNamed('/mycart'),
          ),
        ),
        // Bottom Navigation Icons
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: screenWidth,
            height: 106,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => Get.toNamed('/initial'),
                  icon: Icon(
                    Icons.home_outlined,
                    color: isSelectedHome ? AppColor.lightGreen : AppColor.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.toNamed('/favourite'),
                  icon: Icon(
                    Ionicons.heart_outline,
                    color: isSelectedFavourite ? AppColor.lightGreen : AppColor.black,
                  ),
                ),
                SizedBox(width: screenWidth * 0.15), // Spacer for center button
                IconButton(
                  onPressed: onpressed4,
                  icon: const Icon(Ionicons.notifications_outline),
                ),
                IconButton(
                  onPressed: () => Get.toNamed('/profile'),
                  icon: const Icon(Ionicons.person_outline),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
