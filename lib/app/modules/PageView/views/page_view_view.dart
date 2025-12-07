import 'package:bu_sri_dapur/app/modules/home/views/home_view.dart';
import 'package:bu_sri_dapur/app/modules/menu/views/menu_view.dart';
import 'package:bu_sri_dapur/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:bu_sri_dapur/app/modules/pesanan/views/pesanan_view.dart';
import 'package:bu_sri_dapur/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page_view_controller.dart';


class PageViewView extends GetView<PageViewController> {
  const PageViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: controller.backgroundColor,
        child: SafeArea(child:
        PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.pageIndex.value = index;
          },
          children: [
            HomeView(),
            PemesananView(),
            // PesananView(),
            MenuView(),
            ProfilView()
          ],
        )
        ),
      ),

      bottomNavigationBar:
      new Theme(
        data: Theme.of(context).copyWith(
        canvasColor: controller.buttonColor,
        primaryColor: controller.buttonColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        textTheme: Theme.of(context).textTheme.copyWith(
            bodySmall: new TextStyle(color: Colors.yellow)
        )
    ),child: new BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      currentIndex: controller.pageIndex.value,
      selectedItemColor: Colors.white,
      onTap: controller.changePage,
      items: controller.items,
      type: BottomNavigationBarType.fixed,
    )),
      floatingActionButton: controller.floatingActionButton(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    ));
  }
}
