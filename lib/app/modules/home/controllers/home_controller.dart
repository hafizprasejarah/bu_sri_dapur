import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // warna statis
  var searchText = "".obs;
  var isHidden = true.obs;
  final Color textColor = Color(0xFFE1DED4);
  final Color backgroundColor = const Color(0xFFE1DED4);


  void toggleVisibility() {
    isHidden.value = !isHidden.value;
  }

  void updateSearch(String value) {
    searchText.value = value;
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
