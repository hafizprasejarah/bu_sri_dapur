import 'package:bu_sri_dapur/app/modules/home/views/home_view.dart';
import 'package:bu_sri_dapur/app/modules/pesanan/views/pesanan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page_view_controller.dart';


class PageViewView extends GetView<PageViewController> {
  const PageViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: controller.buttonColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
          ),

          Expanded(child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.pageIndex.value = index;
            },
            children: [
              HomeView(),
              PesananView()
              // Home(),
              // Center(child: Text("Cart Page")),
              // Center(child: Text("Add Page")),
              // Center(child: Text("History Page")),
              // Center(child: Text("Profile Page")),
            ],
          )),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: controller.buttonColor,
        currentIndex: controller.pageIndex.value,
        onTap: controller.changePage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    ));
  }
}
