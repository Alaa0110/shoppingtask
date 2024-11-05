import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoppingtask/core/const_data/app_fonts.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/service/media_query.dart';
import '../mycart_controller/mycart_controller.dart';

class CustomCountItem extends StatelessWidget {
  final int productQ;
  final product;

  const CustomCountItem({super.key, required this.productQ, this.product});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
        init: MyCartController(),
        builder: (controller) {
          return Container(
            height: MediaQueryUtil.screenHeight * 0.2,
            width: MediaQueryUtil.screenWidth * 0.2,
            decoration: BoxDecoration(
              color: AppColor.lightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add,color: AppColor.white,),
                  onPressed: () {
                    controller.addToCart(product);
                  },
                ),
                Text(
                  productQ.toString(),
                  style: const TextStyle(
                      fontFamily: AppFonts.ralewayRegular,
                      color: AppColor.white),
                ),
                IconButton(

                  icon: const Icon(Icons.remove,color: AppColor.white,),
                  onPressed: () {
                    controller.removeFromCart(product);
                  },
                ),
              ],
            ),
          );
        }
    );
  }
}
