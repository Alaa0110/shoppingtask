// lib/views/products_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/const_data/app_fonts.dart';
import '../../core/const_data/app_image.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/prodect_card.dart';
import '../home/home_controller/home_controller.dart';



class ProductsScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'All Products',
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
        wrapLeadingInCircle: true,
        bagIcon: AppImage.bag,
      ),
      body: Obx(() {
        if (homeController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return GestureDetector(
          onTap: (){
            Get.toNamed('/tshirtshop');
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: homeController.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final product = homeController.products[index];
              return prodectCard(product);
            },
          ),
        );
      }),
    );
  }
}