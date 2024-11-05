import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppingtask/view/tshirt_shop/tshirt_controller/tshirt_controller.dart';
import 'package:shoppingtask/view/tshirt_shop/widget/circle_painter.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_fonts.dart';
import '../../core/const_data/app_image.dart';
import '../../widgets/custom_appbar.dart';
import 'package:get/get.dart';

class TshirtPage extends StatelessWidget {
  final TshirtController controller = Get.put(TshirtController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'T-shirt Shop',
        titleStyle: const TextStyle(
          fontFamily: AppFonts.ralewayRegular,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        onMenuPressed: () {
          Get.back();
        },
        onBagPressed: () {
          Get.toNamed('/mycart');
        },
        leadingIcon: AppImage.arrow,
        wrapLeadingInCircle: true,
        bagIcon: AppImage.bag,
        showNotificationDot: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Programmer T-shirt",
                style: TextStyle(fontSize: 26, fontFamily: AppFonts.ralewayBold),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Men’s T-shirt",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.lightGrey,
                  fontFamily: AppFonts.ralewayRegular,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$29.99",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                  fontFamily: AppFonts.poppins,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Obx(
                      () => Image.asset(
                    controller.tshirtImages[controller.selectedImageIndex.value],
                    width: 220,
                    height: 217,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(352, 34),
                  painter: UpwardHalfCirclePainter(),
                ),
                Transform.translate(
                  offset: const Offset(0, 16),
                  child: Container(
                    width: 50,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF707B81),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.white),
                            onPressed: () {
                              if (controller.selectedImageIndex > 0) {
                                controller.changeImage(controller.selectedImageIndex.value - 1);
                              }
                            },
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.arrow_forward_ios_outlined, size: 14, color: Colors.white),
                            onPressed: () {
                              if (controller.selectedImageIndex.value < controller.tshirtImages.length - 1) {
                                controller.changeImage(controller.selectedImageIndex.value + 1);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 56,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.tshirtImages.length,
                separatorBuilder: (context, _) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.changeImage(index),
                    child: Obx(
                          () => Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: index == controller.selectedImageIndex.value
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                        child: Image.asset(controller.tshirtImages[index], fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ......",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11,
                fontFamily: AppFonts.poppins,
                color: AppColor.lightGrey,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                },
                child: const Text(
                  "Read more",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.lightGreen,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {
                      // Add to favorites
                    },
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 208,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Add to cart action
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/bag.svg',
                      color: AppColor.white,
                    ),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16, color: AppColor.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
