import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  // warna statis
  var searchText = "".obs;

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
