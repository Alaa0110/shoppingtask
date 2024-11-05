import 'package:get/get.dart';
import 'package:shoppingtask/core/const_data/const_data.dart';
import 'package:shoppingtask/model/category.dart';
import 'package:shoppingtask/model/product.dart';
import '../../../core/class/crud.dart';
import '../../../core/service/link.dart';

class HomeController extends GetxController {
  var categories = <Category>[].obs;
  var products = <Details>[].obs;
  final Crud _crud = Crud();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  // Fetch categories using the Crud service
  void fetchCategories() async {
    ConstData.isLoading(true);
    final headers = AppLink().getHeaderToken();
    final result = await _crud.getData(AppLink.category, headers);

    result.fold(
          (status) {
        Get.snackbar("Error", "Failed to load categories: ${status.toString()}");
      },
          (data) {
        if (data['data'] != null && data['data'] is List) {
          final List<Category> fetchedCategories =
          (data['data'] as List).map((json) => Category.fromJson(json)).toList();
          categories.assignAll(fetchedCategories);
        } else {
          Get.snackbar("Error", "Invalid response format from the server");
        }
      },
    );

    ConstData.isLoading(false);
  }

  // Fetch products using the Crud service
  void fetchProducts() async {
    ConstData.isLoading(true);
    final headers = AppLink().getHeaderToken();
    final result = await _crud.getData(AppLink.allProducts, headers);

    result.fold(
          (status) {
        Get.snackbar("Error", "Failed to load products: ${status.toString()}");
      },
          (data) {
        if (data['data'] != null && data['data'] is List) {
          final List<Details> fetchedProducts =
          (data['data'] as List).map((json) => Details.fromJson(json)).toList();
          products.assignAll(fetchedProducts);
        } else {
          Get.snackbar("Error", "Invalid response format from the server");
        }
      },
    );

    ConstData.isLoading(false);
  }
}
