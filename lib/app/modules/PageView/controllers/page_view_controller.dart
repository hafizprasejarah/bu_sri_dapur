import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  var pageIndex = 0.obs;
  final pageController = PageController();
  final Color backgroundColor = const Color(0xFFD9D9D9);
  final Color buttonColor = const Color(0xFF254F3C);

  void changePage(int index) {
    pageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
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
