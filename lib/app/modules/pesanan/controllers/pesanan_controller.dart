import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananController extends GetxController {
  // ================== VIEW SWITCHING ==================
  RxString selectedView = "Makanan".obs;

  // ================== DATA MAKANAN ==================
  final List<Map<String, dynamic>> makanan = [
    {"title": "Nasi Goreng", "price": 15000, "image": "assets/images/Nasi Goreng.jpg"},
    {"title": "Ayam Geprek", "price": 18000, "image": "assets/images/Sate Ayam.jpg"},
  ];

  RxList<bool> selectedMakanan = <bool>[].obs;
  RxList<int> qtyMakanan = <int>[].obs;

  // ================== DATA MINUMAN ==================
  final List<Map<String, dynamic>> minuman = [
    {"title": "Es Teh", "price": 5000, "image": "assets/images/cappucino.jpg"},
    {"title": "Jus Jeruk", "price": 10000, "image": "assets/images/coffe_latte.jpg"},
  ];

  RxList<bool> selectedMinuman = <bool>[].obs;
  RxList<int> qtyMinuman = <int>[].obs;

  RxBool showOrderBar = false.obs;

  RxBool showDetailBottom = false.obs;

  void goToDetail() {
    showDetailBottom.value = true;
  }

  void backToSummary() {
    showDetailBottom.value = false;
  }

  List<Map<String, dynamic>> getSelectedItems() {
    List<Map<String, dynamic>> items = [];

    for (int i = 0; i < makanan.length; i++) {
      if (selectedMakanan[i] && qtyMakanan[i] > 0) {
        items.add({
          "title": makanan[i]["title"],
          "qty": qtyMakanan[i],
          "price": makanan[i]["price"],
        });
      }
    }

    for (int i = 0; i < minuman.length; i++) {
      if (selectedMinuman[i] && qtyMinuman[i] > 0) {
        items.add({
          "title": minuman[i]["title"],
          "qty": qtyMinuman[i],
          "price": minuman[i]["price"],
        });
      }
    }

    return items;
  }

  // =====================================================
  // INIT
  // =====================================================
  @override
  void onInit() {
    super.onInit();

    // Generate checkbox dan quantity default
    selectedMakanan.value = List.generate(makanan.length, (_) => false);
    qtyMakanan.value = List.generate(makanan.length, (_) => 1);

    selectedMinuman.value = List.generate(minuman.length, (_) => false);
    qtyMinuman.value = List.generate(minuman.length, (_) => 1);
  }

  // =====================================================
  // ACTION MAKANAN
  // =====================================================
  void toggleMakanan(int i) {
    selectedMakanan[i] = !selectedMakanan[i];
    checkOrderBar();
  }

  void addQtyMakanan(int i) => qtyMakanan[i]++;
  void removeQtyMakanan(int i) {
    if (qtyMakanan[i] > 1) qtyMakanan[i]--;
  }

  // =====================================================
  // ACTION MINUMAN
  // =====================================================
  void toggleMinuman(int i) {
    selectedMinuman[i] = !selectedMinuman[i];
    checkOrderBar();
  }


  void checkOrderBar() {
    bool hasSelected = selectedMakanan.contains(true) ||
        selectedMinuman.contains(true);

    showOrderBar.value = hasSelected;
  }


  void addQtyMinuman(int i) => qtyMinuman[i]++;
  void removeQtyMinuman(int i) {
    if (qtyMinuman[i] > 1) qtyMinuman[i]--;
  }

  // =====================================================
  // TOTAL SEMUA PESANAN
  // =====================================================
  int get totalHarga {
    int total = 0;

    for (int i = 0; i < makanan.length; i++) {
      if (selectedMakanan[i]) {
        int price = (makanan[i]["price"] as num).toInt();
        int qty = (qtyMakanan[i] as num).toInt();
        total += price * qty;
      }
    }

    for (int i = 0; i < minuman.length; i++) {
      if (selectedMinuman[i]) {
        int price = (minuman[i]["price"] as num).toInt();
        int qty = (qtyMinuman[i] as num).toInt();
        total += price * qty;
      }
    }

    return total;
  }
}
