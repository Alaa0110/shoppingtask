import 'package:flutter/material.dart';
import 'package:shoppingtask/core/const_data/app_fonts.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/service/media_query.dart';
import '../../../model/product.dart';


class CustomProductCard extends StatelessWidget {
  final Details product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColor.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        horizontalTitleGap: MediaQueryUtil.screenWidth * 0.1,
        leading: Container(
          width: MediaQueryUtil.screenWidth * 0.20,
          height: MediaQueryUtil.screenWidth * 0.20,
          decoration: BoxDecoration(
            color: AppColor.white,

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
             AppImage.tshirt,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          product.name,
          style: TextStyle(fontFamily: AppFonts.ralewayRegular),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '\$${product.price.toString()}',
          style: TextStyle(fontFamily: AppFonts.poppins),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
