import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void updateName(String newName) => name.value = newName;
  void updateEmail(String newEmail) => email.value = newEmail;
  void updatePassword(String newPassword) => password.value = newPassword;
}