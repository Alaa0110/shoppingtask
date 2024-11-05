import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/const_data/app_colors.dart';
import '../core/const_data/app_fonts.dart';
import '../core/const_data/app_image.dart';
import '../core/service/media_query.dart';
import '../model/product.dart';
import '../view/favourite/favorite_controller/favourite_controller.dart';
import '../view/mycart/mycart_controller/mycart_controller.dart';

Widget prodectCard(Details product, {bool showColors = false}) {
  final FavouriteController favouriteController = Get.find<FavouriteController>();
  final MyCartController cartController = Get.find<MyCartController>();

  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: Container(
      width: MediaQueryUtil.screenWidth * 0.30,
      height: MediaQueryUtil.screenHeight * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Favorite Icon
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      AppImage.heart,
                      width: 18,
                      height: 16,
                      color: favouriteController.isFavorite(product) ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      favouriteController.toggleFavorite(product);
                    },
                  ),
                ),
              ),


              Center(
                child: Image.asset(
                  AppImage.tshirt,
                  fit: BoxFit.cover,
                  width: MediaQueryUtil.screenWidth * 0.30,
                  height: MediaQueryUtil.screenHeight * 0.15,
                ),
              ),
              const SizedBox(height: 8),


              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'BEST SELLER',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.poppins,
                    color: AppColor.lightGreen,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 8.0, right: 8.0),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColor.hintColor,
                    fontFamily: AppFonts.ralewayBold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8.0, right: 8.0),
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColor.black,
                    fontFamily: AppFonts.poppins,
                  ),
                ),
              ),
            ],
          ),


          Positioned(
            bottom: 0,
            right: 0,
            child: showColors
                ? Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
                : Container(
                              width: 34,
                              height: 35.5,
                              decoration: const BoxDecoration(
                color: AppColor.lightGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                              ),
                              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 20.0),
                onPressed: () {
                  cartController.addToCartAPI(product);
                },
                              ),
                            ),
          ),
        ],
      ),
    ),
  );
}
