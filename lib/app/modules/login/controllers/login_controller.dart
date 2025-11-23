import 'dart:ui';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final Color backgroundColor = const Color(0xD9D9D9);
  final Color buttonColor = const Color(0x254F3C);

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
