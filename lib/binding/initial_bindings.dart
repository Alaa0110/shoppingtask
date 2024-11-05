import 'package:get/get.dart';
import 'package:shoppingtask/view/mycart/mycart_controller/mycart_controller.dart';
import '../core/class/crud.dart';
import '../core/service/network_connection.dart';
import '../view/favourite/favorite_controller/favourite_controller.dart';



class InitialBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(Crud());
    Get.put(FavouriteController());
    Get.put(MyCartController());
    Get.put(NetworkManager());
  }
}