import 'package:get/get.dart';
import 'package:shoppingtask/view/favourite/favourite_screen.dart';
import 'package:shoppingtask/view/prodect/products_screen.dart';
import 'package:shoppingtask/view/mycart/mycart_screen.dart';
import 'package:shoppingtask/view/profile/profile_screen.dart';
import 'package:shoppingtask/view/side_menu_screen/side_menu_screen.dart';
import 'package:shoppingtask/view/tshirt_shop/tshirt_shop_screen.dart';

import '../../view/home/home_screen.dart';



class AppRoutes {
  static const initial = '/';
  static const mycart = '/mycart';
  static const favourite = '/favourite';
  static const allprodect = '/allprodect';
  static const profile = '/profile';
  static const sidemenu = '/sidemenu';
  static const registerSelection = '/register_selection';
  static const tshirtshop = '/tshirtshop';


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: mycart, page: () => MyCartScreen()),
    GetPage(name: favourite, page: () => FavoritesScreen()),
    GetPage(name: allprodect, page: () => ProductsScreen()),
    GetPage(name: profile, page: () => ProfileView()),
    GetPage(name: sidemenu, page: () => SideMenuScreen()),
    GetPage(name: tshirtshop, page: () => TshirtPage()),


  ];
}
