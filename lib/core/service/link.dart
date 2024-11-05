import '../const_data/const_data.dart';

class AppLink {
  static const String appRoot = "https://task.focal-x.com";
  static const String serverApiRoot = "$appRoot/api";

  // API Endpoints
  static const String category = "$serverApiRoot/categories";
  static const String allProducts = "$serverApiRoot/products";
  static const String orderProduct = "$serverApiRoot/orders";
  static const String getProduct = "$serverApiRoot/orders";

  // Headers without authorization
  Map<String, String> getHeader() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
  }

  // Headers with authorization
  Map<String, String> getHeaderToken() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': 'Bearer ${ConstData.token}',
    };
  }
}
