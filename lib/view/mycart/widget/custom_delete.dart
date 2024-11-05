import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/service/media_query.dart';
import '../mycart_controller/mycart_controller.dart';

class CustomDelete extends StatelessWidget {
  final product;

  const CustomDelete({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
        init: MyCartController(),
        builder: (controller) {
          return Container(
              height: MediaQueryUtil.screenHeight,
              width: MediaQueryUtil.screenWidth,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(icon:  SvgPicture.asset(
                AppImage.delete,
                height: MediaQueryUtil.screenWidth * 0.06,
              ),
                onPressed: (){
                  controller.removeFromCart(product);
                },)
          );
        }
    );
  }
}
