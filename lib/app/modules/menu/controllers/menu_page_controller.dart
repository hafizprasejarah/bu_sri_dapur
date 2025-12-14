import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPageController  extends GetxController {
  var selectedView = "Makanan".obs;
  RxBool isSelectMode = false.obs;

  // status checklist
  RxList<bool> selectedMakanan = <bool>[].obs;
  RxList<bool> selectedMinuman = <bool>[].obs;

  // ================== DATA ==================
  final List<Map<String, dynamic>> makanan = [
    {
      "id": "mkn_001",
      "title": "Kuentang",
      "price": 24000,
      "image": "assets/images/Mie Ayam.jpg"
    },
    {
      "id": "mkn_002",
      "title": "Bakso",
      "price": 24000,
      "image": "assets/images/bakso.jpg"
    },
  ];

  final List<Map<String, dynamic>> minuman = [
    {
      "id": "mnm_001",
      "title": "Es Teh",
      "price": 5000,
      "image": "assets/images/cold_brew.jpg"
    },
  ];

  @override
  void onInit() {
    super.onInit();
    selectedMakanan.assignAll(List.generate(makanan.length, (_) => false));
    selectedMinuman.assignAll(List.generate(minuman.length, (_) => false));
  }

  void toggleSelectMode() {
    isSelectMode.toggle();
  }

  void toggleItem(int index) {
    if (selectedView.value == "Makanan") {
      selectedMakanan[index] = !selectedMakanan[index];
      selectedMakanan.refresh();
    } else {
      selectedMinuman[index] = !selectedMinuman[index];
      selectedMinuman.refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
  // void increment() => count.value++;
}
