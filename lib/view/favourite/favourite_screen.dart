
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/const_data/app_fonts.dart';
import '../../core/const_data/app_image.dart';
import '../../widgets/bnb.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/prodect_card.dart';
import 'favorite_controller/favourite_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final FavouriteController favouriteController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Favourite',
        titleStyle: const TextStyle(
            fontFamily: AppFonts.ralewayRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16
        ),
        onMenuPressed: () {
          Get.back();
        },
        leadingIcon: AppImage.arrow,
        wrapLeadingInCircle: true,
        bagIcon: AppImage.heart,
      ),
      body: Obx(() {
        if (favouriteController.favorites.isEmpty) {
          return const Center(child: Text("No favorite products"));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: favouriteController.favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final product = favouriteController.favorites[index];
            return prodectCard(product, showColors: true);
          },
        );
      }),
      bottomNavigationBar: BottomNavBar(
        isSelectedFavourite: true,
      ),
    );
  }
}

