import 'package:bu_sri_dapur/app/modules/home/components/slider-menu-makanan.dart';
import 'package:bu_sri_dapur/app/modules/home/components/slider-menu-minuman.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFE1DED4),
        appBar: AppBar(
          title: Text("Dapur Bu Sri", style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    // ================= CARD ADMIN ==================
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF214D3A),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Row(

                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blueGrey.shade100,
                                backgroundImage:
                                AssetImage('assets/images/Admin.jpg'),
                              ),
                              SizedBox(width: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Admin Ireng",
                                    style: TextStyle(
                                      color: controller.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "ID",
                                    style: TextStyle(
                                      color: controller.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 1.5,
                            color: controller.textColor,
                          ),
                          SizedBox(height: 10),

                          // ============= TOTAL PENDAPATAN ==============
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total pendapatan",
                                      style: TextStyle(
                                        color: controller.textColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.credit_card,
                                            color: controller.textColor, size: 20),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Obx(() {
                                            return Text(
                                              controller.isHidden.value
                                                  ? "●●●●●●●●"
                                                  : "Rp. 100.000,00",
                                              style: TextStyle(
                                                color: controller.textColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            );
                                          }),
                                        ),
                                        Obx(() {
                                          return IconButton(
                                            icon: Icon(
                                              controller.isHidden.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: controller.textColor,
                                            ),
                                            onPressed: controller.toggleVisibility,
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 15),

                              // Garis pemisah
                              Container(
                                width: 1.5,
                                height: 70,
                                color: controller.textColor,
                              ),

                              SizedBox(width: 15),

                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dilayani :",
                                      style: TextStyle(
                                        color: controller.textColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.person,
                                            color: controller.textColor, size: 25),
                                        SizedBox(width: 10),
                                        Text(
                                          "10",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: controller.textColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // ================= SEARCH BAR ==================
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) => controller.updateSearch(value),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // ==================== MAKANAN =====================
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Makanan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _seeMoreButton(),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(child: const MenuSliderLoop()),
            ),

            // ==================== MINUMAN =====================
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Minuman",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _seeMoreButton(),
                ],
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(child: const DrinkSliderLoop()),
            ),
          ],
        ),
    );
  }
}

Widget _seeMoreButton() {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      side: BorderSide(color: Colors.black, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
    child: Text(
      "See full Menu",
      style: TextStyle(fontSize: 12, color: Colors.black),
    ),
  );
}