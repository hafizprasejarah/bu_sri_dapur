import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pesanan_controller.dart';
import '../components/order_card_makanan.dart';
import '../components/order_card_minuman.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1DED4),
      bottomNavigationBar: Obx(() {
        if (!controller.showOrderBar.value) return const SizedBox();

        // jika mode detail aktif
        if (controller.showDetailBottom.value) {
          return _orderDetailBottomBar();
        }

        // default mode
        return _orderSummaryBottomBar();
      }),

      appBar: AppBar(
        title: const Text(
          "Order",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            _title("Nama Pembeli"),
            _inputField("Masukkan nama..."),

            const SizedBox(height: 20),

            Text(
            "Pilih Makanan",style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            )
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Obx(() => _viewButton(
                  label: "Makanan",
                  active: controller.selectedView.value == "Makanan",
                  onTap: () => controller.selectedView.value = "Makanan",
                )),
                const SizedBox(width: 10),
                Obx(() => _viewButton(
                  label: "Minuman",
                  active: controller.selectedView.value == "Minuman",
                  onTap: () => controller.selectedView.value = "Minuman",
                )),
              ],
            ),

            const SizedBox(height: 20),

            Obx(() {
              if (controller.selectedView.value == "Makanan") {
                return Column(
                  children: List.generate(controller.makanan.length, (i) {
                    return OrderItemCardMakanan(
                      image: controller.makanan[i]["image"],
                      title: controller.makanan[i]["title"],
                      subtitle: "Makanan",
                      price: controller.makanan[i]["price"].toDouble(),
                      isSelected: controller.selectedMakanan[i],
                      quantity: controller.qtyMakanan[i],
                      onSelect: () => controller.toggleMakanan(i),
                      onAdd: () => controller.addQtyMakanan(i),
                      onRemove: () => controller.removeQtyMakanan(i),
                    );
                  }),
                );
              }

              // default: Minuman
              return Column(
                children: List.generate(controller.minuman.length, (i) {
                  return OrderItemCardMinuman(
                    image: controller.minuman[i]["image"],
                    title: controller.minuman[i]["title"],
                    subtitle: "Minuman",
                    price: controller.minuman[i]["price"].toDouble(),
                    isSelected: controller.selectedMinuman[i],
                    quantity: controller.qtyMinuman[i],
                    onSelect: () => controller.toggleMinuman(i),
                    onAdd: () => controller.addQtyMinuman(i),
                    onRemove: () => controller.removeQtyMinuman(i),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _viewButton({
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: active ? const Color(0xFF214D3A) : Colors.transparent,
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: active ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _title(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );

  Widget _inputField(String hint) => Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    ),
  );
}

Widget _orderSummaryBottomBar() {
  final c = Get.find<PesananController>();
  final height = Get.mediaQuery.size.height * 0.18; // 1/5 layar

  return Container(
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, -2),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // total
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text(
              "Rp ${c.totalHarga}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // tombol lanjut
        GestureDetector(
          onTap: () => c.goToDetail(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Lanjut",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _orderDetailBottomBar() {
  final c = Get.find<PesananController>();
  final height = Get.mediaQuery.size.height * 0.40; // 40%

  // ambil list pesanan
  final pesanan = c.getSelectedItems(); // nanti kita buat fungsinya

  return Container(
    height: height,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: Offset(0, -3),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),

        const Text(
          "Rincian Pesanan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),

        // list pesanan
        Expanded(
          child: ListView.builder(
            itemCount: pesanan.length,
            itemBuilder: (context, index) {
              final item = pesanan[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${item['title']} x${item['qty']}"),
                    Text("Rp ${item['price'] * item['qty']}"),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // konfirmasi button
        GestureDetector(
          onTap: () {
            // nanti kirim ke firebase
            debugPrint("Konfirmasi pesanan!");
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                "Konfirmasi Pesanan",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

