import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingtask/core/const_data/app_fonts.dart';
import 'package:shoppingtask/core/const_data/app_image.dart';
import 'package:shoppingtask/view/home/widget/category_button.dart';
import 'package:shoppingtask/view/home/widget/promotional_stack.dart';
import 'package:shoppingtask/view/home/widget/section_header.dart';
import '../../core/const_data/const_data.dart';
import '../../widgets/bnb.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/prodect_card.dart';

import 'home_controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Explore',
        onMenuPressed: () => Get.toNamed('/sidemenu'),
        onBagPressed: () => Get.toNamed('/mycart'),
        leadingIcon: AppImage.linesicon,
        highlightIcon: AppImage.highlighticon,
        bagIcon: AppImage.bag,
        showNotificationDot: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20 , top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Category', style: TextStyle(fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.ralewayRegular)),
              const SizedBox(height: 10.0),
              Obx(() {
                if (ConstData.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: homeController.categories.map((category) =>
                        buildCategoryButton(category.name)).toList(),
                  ),
                );
              }),
              const SizedBox(height: 25.0),
              buildSectionHeader('Popular T-shirt', () {
                homeController.fetchProducts();
                Get.toNamed('/allprodect');
              }),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 300,
                child: Obx(() {
                  if (ConstData.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed('/tshirtshop');
                    },
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.products.length.clamp(0, 2),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.68),
                      itemBuilder: (context, index) =>
                          prodectCard(homeController.products[index]),
                    ),
                  );
                }),
              ),
              buildSectionHeader('New Arrivals', () {}),
              const SizedBox(height: 10.0),
              buildPromotionalStack(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(isSelectedHome: true),
    );
  }
}