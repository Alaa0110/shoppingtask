// lib/const_data/const_data.dart
import 'dart:async';
import 'package:get/get.dart';

class ConstData {
  static var isLoading = true.obs;
  static String token = "1380|RXZknLFTJ3iyGycy0O7XQEAHttr84IkK4KDnWPJO42380f74";
  static String map_key = "";
  static String companyCode = "";



  /*static Future<void> UpdateToken(String newToken) async {
    token = newToken;
    isLogin.value = true;
  }

  static Future<void> startTokenupdater() async {
    Timer.periodic(Duration(seconds: 20), (timer) {
      if (isLogin.value) {
        // تأكد من أنك تستخدم دالة لتحديث الـ Token هنا إذا كان لديك API يتيح لك ذلك
      }
    });
  }*/
}
