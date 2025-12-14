import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahmenuController extends GetxController {
  RxString kategori = "Makanan".obs;
  final ImagePicker picker = ImagePicker();

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
