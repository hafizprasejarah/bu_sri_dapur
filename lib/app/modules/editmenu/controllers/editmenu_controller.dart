import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditmenuController extends GetxController {
  RxString kategori = "Makanan".obs;
  final ImagePicker picker = ImagePicker();

  late TextEditingController namaController;
  late TextEditingController hargaController;

  late String imageUrl;

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

  void setKategori(String value) {
    kategori.value = value;
  }
  Rx<File?> imageFile = Rx<File?>(null);

  /// pick image dari galeri
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70, // biar ringan
      );

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal memilih gambar",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;



    namaController = TextEditingController(text: args['title']);
    hargaController = TextEditingController(text: args['price'].toString());
    kategori.value = args['kategori'] ?? "Makanan";
    imageUrl = args['image'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    namaController.dispose();
    hargaController.dispose();
  }

  void increment() => count.value++;
}
