import 'package:get/get.dart';

class ReOrderController extends GetxController {

  final List<Map<String, dynamic>> makanan = [
    {"title": "Nasi Goreng", "price": 15000, "image": "assets/images/Nasi Goreng.jpg"},
    {"title": "Ayam Geprek", "price": 18000, "image": "assets/images/Sate Ayam.jpg"},
  ];

  // ================== DATA MINUMAN ==================
  final List<Map<String, dynamic>> minuman = [
    {"title": "Es Teh", "price": 5000, "image": "assets/images/cappucino.jpg"},
    {"title": "Jus Jeruk", "price": 10000, "image": "assets/images/coffe_latte.jpg"},
  ];

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
