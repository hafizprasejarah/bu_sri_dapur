import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../menu/controllers/menu_page_controller.dart';
import '../../pemesanan/controllers/pemesanan_controller.dart';
import '../../pesanan/controllers/pesanan_controller.dart';
import '../../profil/controllers/profil_controller.dart';
import '../controllers/page_view_controller.dart';

class PageViewBinding extends Bindings {
  @override
  void dependencies() {
    // Controller utama untuk PageView
    Get.lazyPut<PageViewController>(() => PageViewController());

    // Controller untuk setiap halaman PageView
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PemesananController>(() => PemesananController());
    Get.lazyPut<PesananController>(() => PesananController());
    Get.lazyPut<MenuPageController>(() => MenuPageController());
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}
