import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shoppingtask/core/const_data/app_fonts.dart';
import 'package:shoppingtask/view/mycart/widget/custom_count_item.dart';
import 'package:shoppingtask/view/mycart/widget/dash.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_image.dart';
import '../../core/service/media_query.dart';
import '../../widgets/custom_appbar.dart';
import 'widget/cartitemcard.dart';
import 'widget/custom_delete.dart';
import 'mycart_controller/mycart_controller.dart';


class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    final MyCartController controller = Get.put(MyCartController());

    controller.fetchCartItems();
    return GetBuilder<MyCartController>(
        init: MyCartController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColor.white,
            appBar:CustomAppBar(
              titleText: 'My Cart',
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

            ),

            body: controller.cartItems.isEmpty
                ? const Center(
              child: Text(
                'No items in cart',
                style: TextStyle(
                    fontFamily: AppFonts.ralewayRegular,
                    color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: controller.cartItems.toSet().toList().length,
              itemBuilder: (context, index) {
                final product = controller.cartItems[index];
                final quantity = controller.productQuantity(product);
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.20,
                    children: [
                      SizedBox(
                        width: MediaQueryUtil.screenWidth * 0.2,
                        child: CustomCountItem(product:product,productQ: quantity,),
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.25,
                    children: [
                      SizedBox(
                        width: MediaQueryUtil.screenWidth * 0.2,
                        child: CustomDelete(product: product,),
                      ),
                    ],
                  ),
                  child: CustomProductCard(product: product,),
                );
              },
            ),
            bottomNavigationBar: GetBuilder<MyCartController>(
              builder: (controller) {
                final deliveryFee = controller.totalPrice > 0 ? 60.20 : 0.00;
                final totalCost = controller.totalPrice + deliveryFee;
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Row(
                          children: [
                            const Text(
                              'Subtotal:',
                              style: TextStyle(
                                  fontFamily: AppFonts.ralewayRegular,
                                  color: AppColor.grey),
                            ),
                            const Spacer(),
                            Text(
                              '\$${controller.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontFamily: AppFonts.poppins
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                        Row(
                          children: [
                            const Text(
                              'Delivery:',
                              style: TextStyle(
                                  fontFamily: AppFonts.ralewayRegular,
                                  color: AppColor.grey),
                            ),
                            const Spacer(),
                            Text(
                              '\$${deliveryFee.toStringAsFixed(2)}',
                              style: const TextStyle(fontFamily: AppFonts.poppins),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Dash(
                          direction: Axis.horizontal,
                          length: MediaQueryUtil.screenWidth * 0.9,
                          dashLength: 5,
                          dashGap: 2,
                          dashColor: Colors.grey,
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Row(
                          children: [
                            const Text(
                              'Total Cost',
                              style: TextStyle(
                                fontFamily: AppFonts.ralewayRegular
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${totalCost.toStringAsFixed(2)}',
                              style:const TextStyle(fontFamily: AppFonts.poppins , color: AppColor.lightGreen),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.04),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
