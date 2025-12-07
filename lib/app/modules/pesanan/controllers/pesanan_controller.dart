import 'package:get/get.dart';

class PesananController extends GetxController {
  // kategori
  var categories = ["Makanan", "Minuman"];
  var selectedCategory = "Makanan".obs;

  // data dummy
  var allItems = [
    {
      "image": "assets/images/bakso.jpg",
      "title": "Bakso",
      "kategori": "Makanan",
      "price": 24000
    },
    {
      "image": "assets/images/cold_brew.jpg",
      "title": "Es Teh",
      "kategori": "Minuman",
      "price": 5000
    },
    {
      "image": "assets/images/Nasi Goreng.jpg",
      "title": "Nasi Goreng",
      "kategori": "Makanan",
      "price": 20000
    },
    {
      "image": "assets/images/cappucino.jpg",
      "title": "Jus Mangga",
      "kategori": "Minuman",
      "price": 10000
    },
  ].obs;

  // checklist (akan diisi sesuai panjang filteredItems)
  var selectedList = <bool>[].obs;

  // quantity tiap item (global berdasarkan index allItems)
  var quantities = List<int>.filled(20, 0).obs;

  // -----------------------

  @override
  void onInit() {
    super.onInit();
    resetChecklist(); // pertama kali load
  }

  // ambil list item berdasarkan kategori
  List<Map<String, dynamic>> get filteredItems {
    return allItems
        .where((e) => e["kategori"] == selectedCategory.value)
        .toList();
  }

  // ubah kategori
  void filterCategory(String cat) {
    selectedCategory.value = cat;
    resetChecklist();
  }

  // select checklist
  void selectItem(int index) {
    if (index < selectedList.length) {
      selectedList[index] = !selectedList[index];
      selectedList.refresh();
    }
  }

  // RESET checklist ketika kategori berubah
  void resetChecklist() {
    int itemCount = filteredItems.length;

    // isi ulang selectedList sesuai jumlah item
    selectedList.value = List.generate(itemCount, (_) => false);
  }

  // quantity
  void increment(int index) {
    quantities[index]++;
    quantities.refresh();
  }

  void decrement(int index) {
    if (quantities[index] > 0) {
      quantities[index]--;
      quantities.refresh();
    }
  }
}
