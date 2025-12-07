import 'dart:ui';
import 'package:get/get.dart';

class PesananController extends GetxController {
  var selectedIndex = (-1).obs;

  var categories = ["Makanan", "Minuman"];
  var selectedCategory = "Makanan".obs;

  // contoh data dummy, nanti diganti backend
  var allItems = [
    {"image": "assets/images/bakso.jpg", "title": "Bakso", "kategori": "Makanan", "price": 24000},
    {"image": "assets/images/cold_brew.jpg", "title": "Es Teh", "kategori": "Minuman", "price": 5000},
    {"image": "assets/images/Nasi Goreng.jpg", "title": "Nasi Goreng", "kategori": "Makanan", "price": 20000},
    {"image": "assets/images/cappucino.jpg", "title": "Jus Mangga", "kategori": "Minuman", "price": 10000},
  ].obs;

  // jumlah item tiap menu
  var quantities = List<int>.filled(20, 0).obs;

  void filterCategory(String cat) {
    selectedCategory.value = cat;
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  void increment(int index) {
    quantities[index]++;
  }

  void decrement(int index) {
    if (quantities[index] > 0) quantities[index]--;
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

  // void increment() => count.value++;
}
