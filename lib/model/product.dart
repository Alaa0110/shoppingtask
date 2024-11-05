import '../core/service/link.dart';

class Details {
  final int id;
  final String name;
  final String image;
  final double price;
  final int evaluation;
  final double discount;
  final String category;
  final String subCategory;

  Details({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.evaluation,
    required this.discount,
    required this.category,
    required this.subCategory,
  });


  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['id'],
      name: json['name'],
      image: "${AppLink.appRoot}/${json['image']}",
      price: (json['price'] as num).toDouble(),
      evaluation: json['evaluation'],
      discount: (json['discount'] as num).toDouble(),
      category: json['sub-category']['category']['name'],
      subCategory: json['sub-category']['name'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image.replaceFirst("${AppLink.appRoot}/", ""), // Remove base URL for storage
      'price': price,
      'evaluation': evaluation,
      'discount': discount,
      'category': category,
      'subCategory': subCategory,
    };
  }
}
