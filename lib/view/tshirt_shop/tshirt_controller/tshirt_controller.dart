import 'package:get/get.dart';
import '../../../core/const_data/app_image.dart';


class TshirtController extends GetxController {
  var selectedImageIndex = 0.obs;

  final List<String> tshirtImages = [
    AppImage.shirt1,
    AppImage.shirt2,
    AppImage.shirt3,
    AppImage.tshirt,
    AppImage.shirt4,
  ];

  void changeImage(int index) {
    selectedImageIndex.value = index;
  }
}
