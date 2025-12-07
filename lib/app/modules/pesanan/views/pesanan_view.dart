import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/order_card.dart';
import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              "Order",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF214D3A),
              ),
            ),
            SizedBox(height: 20),

            // ==== NAMA PEMBELI ====
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Pembeli",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukkan nama...",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ==== PILIH PESANAN ====
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Pesanan",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari pesanan...",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ==== BUTTON KATEGORI ====
            Row(
              children: [
                Obx(() => categoryButton(
                  "Makanan",
                  controller.selectedCategory.value == "Makanan",
                      () => controller.filterCategory("Makanan"),
                )),
                SizedBox(width: 10),
                Obx(() => categoryButton(
                  "Minuman",
                  controller.selectedCategory.value == "Minuman",
                      () => controller.filterCategory("Minuman"),
                )),
              ],
            ),

            SizedBox(height: 20),

            // ===== LIST MENU =====
            Obx(() {
              var filtered = controller.allItems
                  .where((item) => item["kategori"] == controller.selectedCategory.value)
                  .toList();

              return Column(
                children: [
                  for (int i = 0; i < filtered.length; i++)
                    OrderItemCard(
                      image: filtered[i]["image"] as String,
                      title: filtered[i]["title"] as String,
                      subtitle: filtered[i]["kategori"] as String,
                      price: (filtered[i]["price"] as num).toDouble(),
                      isSelected: controller.selectedIndex.value == i,
                      quantity: controller.quantities[i],
                      onSelect: () => controller.selectItem(i),
                      onAdd: () => controller.increment(i),
                      onRemove: () => controller.decrement(i),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget categoryButton(String label, bool isActive, VoidCallback onTap) {
  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      backgroundColor: isActive ? Color(0xFF214D3A) : Colors.transparent,
      side: BorderSide(color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 12,
        color: isActive ? Colors.white : Colors.black,
      ),
    ),
  );
}
