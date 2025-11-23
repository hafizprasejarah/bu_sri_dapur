import 'dart:ui';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final Color backgroundColor = const Color(0xFFD9D9D9);
  final Color buttonColor = const Color(0xFF254F3C);

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
  isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
