import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingtask/core/const_data/app_image.dart';
import 'package:shoppingtask/view/profile/profile_controller/profile_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppingtask/view/profile/widget/text_field.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_fonts.dart';
import '../../core/service/media_query.dart';
import '../../widgets/custom_appbar.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);

    return Scaffold(
      appBar:  CustomAppBar(
        titleText: 'Profile',
        titleStyle: const TextStyle(
            fontFamily: AppFonts.ralewayRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16
        ),
        onMenuPressed: () {
          Get.back();
        },
        onBagPressed: () {
          Get.toNamed('/mycart');
        },
        leadingIcon: AppImage.arrow,
        wrapLeadingInCircle: true
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: MediaQueryUtil.screenHeight * 0.25),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQueryUtil.screenWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.1),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Name',
                        style: TextStyle(
                          fontFamily: AppFonts.ralewayRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          color: AppColor.lightGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                    buildTextField(
                      hintText: 'Programmer X',
                      onChanged: controller.updateName,
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: AppFonts.ralewayRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          color: AppColor.lightGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                    buildTextField(
                      hintText: 'Programmerx@gmail.com',
                      onChanged: controller.updateEmail,
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.02),


                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: AppFonts.ralewayRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          color: AppColor.lightGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                    buildTextField(
                      hintText: '*********',
                      onChanged: controller.updatePassword,
                      obscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Recovery Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.33,
                            color: AppColor.lightGrey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightGreen,
                        minimumSize: Size(
                          MediaQueryUtil.screenWidth * 0.9,
                          MediaQueryUtil.screenHeight * 0.07,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Save Now',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.white,
                          fontFamily: AppFonts.ralewayRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQueryUtil.screenHeight * 0.1,
            left: MediaQueryUtil.screenWidth * 0.35,
            child: ClipOval(
              child: Image.asset(
                AppImage.profile,
                width: MediaQueryUtil.screenWidth * 0.25,
                height: MediaQueryUtil.screenWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQueryUtil.screenHeight * 0.1 + MediaQueryUtil.screenWidth * 0.25 - MediaQueryUtil.screenWidth * 0.08,
            left: MediaQueryUtil.screenWidth * 0.35 + MediaQueryUtil.screenWidth * 0.25 - MediaQueryUtil.screenWidth * 0.08,
            child: GestureDetector(
              onTap: () {
              },
              child: SvgPicture.asset(
                AppImage.edit,
                width: MediaQueryUtil.screenWidth * 0.08,
                height: MediaQueryUtil.screenWidth * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
