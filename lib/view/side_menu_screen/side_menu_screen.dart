import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppingtask/core/const_data/app_fonts.dart';
import 'package:shoppingtask/view/side_menu_screen/widget/custom_list_tile.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_image.dart';
import '../../core/service/media_query.dart';
import 'package:get/get.dart';
class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return Drawer(
      backgroundColor: AppColor.black,
      child: Padding(
        padding: EdgeInsets.all(MediaQueryUtil.screenWidth * 0.04),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQueryUtil.screenWidth * 0.1,
                  backgroundImage: AssetImage(AppImage.profile),
                ),
              ],
            ),
            SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
            Text(
              "Programmer X",
              style: TextStyle(
                color: AppColor.white,
                fontFamily: AppFonts.ralewayRegular,
                fontSize: MediaQueryUtil.screenWidth * 0.05,
              ),
            ),
            SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
            CustomListTile(
              iconPath: AppImage.profileIcon,
              title: 'Profile',
              onTap: () {
                Get.toNamed('/profile');
              },
            ),
            CustomListTile(
              iconPath: AppImage.bag,
              title: 'My Cart',
              onTap: () {
                Get.toNamed('/mycart');
              },
            ),
            CustomListTile(
              iconPath: AppImage.heart,
              title: 'Favorite',
              onTap: () {
                Get.toNamed('/favourite');
              },
            ),
            CustomListTile(
              iconPath: AppImage.order,
              title: 'Orders',
              onTap: () {

              },
            ),
            CustomListTile(
              iconPath: AppImage.notification,
              title: 'Notifications',
              onTap: () {
              },
            ),
            CustomListTile(
              iconPath: AppImage.setting,
              title: 'Settings',
              onTap: () {},
            ),
            const Divider(color: AppColor.white, thickness: 1),
            TextButton(
              onPressed: () {

              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImage.logout,
                    color: AppColor.white,
                  ),
                  SizedBox(width: MediaQueryUtil.screenWidth * 0.04),
                  const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: AppFonts.ralewayRegular,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
