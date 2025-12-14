import 'package:get/get.dart';

import '../modules/PageView/bindings/page_view_binding.dart';
import '../modules/PageView/views/page_view_view.dart';
import '../modules/editmenu/bindings/editmenu_binding.dart';
import '../modules/editmenu/views/editmenu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/pemesanan/bindings/pemesanan_binding.dart';
import '../modules/pemesanan/views/pemesanan_view.dart';
import '../modules/pesanan/bindings/pesanan_binding.dart';
import '../modules/pesanan/views/pesanan_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/tambahmenu/bindings/tambahmenu_binding.dart';
import '../modules/tambahmenu/views/tambahmenu_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PAGE_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_VIEW,
      page: () => const PageViewView(),
      binding: PageViewBinding(),
    ),
    GetPage(
      name: _Paths.PESANAN,
      page: () => const PesananView(),
      binding: PesananBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.PEMESANAN,
      page: () => const PemesananView(),
      binding: PemesananBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => const PembayaranView(),
      binding: PembayaranBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAHMENU,
      page: () => const TambahmenuView(),
      binding: TambahmenuBinding(),
    ),
    GetPage(
      name: _Paths.EDITMENU,
      page: () => const EditmenuView(),
      binding: EditmenuBinding(),
    ),
  ];
}
