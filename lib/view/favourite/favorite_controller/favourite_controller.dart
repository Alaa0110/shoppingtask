
import 'package:get/get.dart';
import '../../../model/product.dart';


class FavouriteController extends GetxController {
  var products = <Details>[].obs;
  var favorites = <Details>[].obs;


  void toggleFavorite(Details product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }


  bool isFavorite(Details product) => favorites.contains(product);
}
