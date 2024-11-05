import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/const_data/const_data.dart';
import '../../../core/service/link.dart';
import '../../../model/product.dart';

class MyCartController extends GetxController{
  var cartItems = <Details>[].obs;


  Future<void> addToCartAPI(Details product) async {
    final response = await http.post(
      Uri.parse(AppLink.orderProduct),
      body: jsonEncode({
        "product_id": product.id,
        "quantity": 1,
      }),
      headers: {"Content-Type": "application/json",'Authorization': 'Bearer ${ConstData.token}',},
    );

    if (response.statusCode == 200) {
      cartItems.add(product);
      update();
      Get.snackbar("Success", "Product added to your cart");
    } else {
      Get.snackbar("Error", "Failed to add product to cart");
    }
  }

  // Get products from API
  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse(AppLink.getProduct), headers: {"Content-Type": "application/json",'Authorization': 'Bearer ${ConstData.token}',});

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)["data"];
      cartItems.value = data.map((json) => Details.fromJson(json["peoduct"])).toList();
      update();
    } else {
      Get.snackbar("Error", "Failed to fetch cart items");
    }
  }

  void addToCart(Details product) {
    cartItems.add(product);
    update();
  }

  void removeFromCart(Details product) {
    cartItems.remove(product);
    update();
  }

  void deleteAllCart() {
    cartItems.clear();
    update();
  }

  Map<Details, int> getCartItemsWithQuantities() {
    final Map<Details, int> quantities = {};
    for (var product in cartItems) {
      quantities[product] = productQuantity(product);
    }
    return quantities;
  }


  int get totalItems => cartItems.length;


  double get totalPrice => cartItems.fold(0, (sum, product) => sum + product.price);
  double get total=> cartItems.fold(0, (sum, product) => sum + product.price);

  int productQuantity(Details product) {
    return cartItems.where((p) => p == product).length;
  }


}