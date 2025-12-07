import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  final Color textColor = const Color(0xFFE1DED4);
  var pageIndex = 0.obs;
  final pageController = PageController();
  final Color backgroundColor = const Color(0xFFD9D9D9);
  final Color buttonColor = const Color(0xFF254F3C);

// list bottomnavigation
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: "Menu",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profil",
    ),
  ];

// FloatingActionButton
  floatingActionButton() {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(
          side: BorderSide(
            color: buttonColor,
            width: 4,
          ),
        ),

        child: Icon(Icons.add, size: 35, color: buttonColor),
      ),
    );
  }

  void changePage(int index) {
    pageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
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
