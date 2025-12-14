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
        if (controller.isLoadingPembayaran.value) {
          return _loadingBottomBar();
        }

        if (controller.StatusPembayaran.value == "success") {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              controller.StatusPembayaran.value = "";
              controller.showOrderBar.value = false;
              controller.showDetailBottom.value = false;

              // RESET DATA ORDER
              controller.selectedMakanan.value =
              List<bool>.filled(controller.makanan.length, false);

              controller.selectedMinuman.value =
              List<bool>.filled(controller.minuman.length, false);

              controller.qtyMakanan.value =
              List<int>.filled(controller.makanan.length, 1);

              controller.qtyMinuman.value =
              List<int>.filled(controller.minuman.length, 1);
            },
            child: _paymentSuccessBottomBar(),
          );
        }

        if (controller.StatusPembayaran.value == "pending") {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              controller.StatusPembayaran.value = "";
              controller.showOrderBar.value = false;
              controller.showDetailBottom.value = false;

              // RESET DATA ORDER
              controller.selectedMakanan.value =
              List<bool>.filled(controller.makanan.length, false);

              controller.selectedMinuman.value =
              List<bool>.filled(controller.minuman.length, false);

              controller.qtyMakanan.value =
              List<int>.filled(controller.makanan.length, 1);

              controller.qtyMinuman.value =
              List<int>.filled(controller.minuman.length, 1);
            },
            child: _paymentPendingBottomBar(),
          );
        }


        if (!controller.showOrderBar.value) return const SizedBox();

        if (controller.showDetailBottom.value) {
          return _orderDetailBottomBar();
        }

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
  final height = Get.mediaQuery.size.height * 0.55; // dinaikkan 55%

  final pesanan = c.getSelectedItems(); // list pesanan

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Nama Pembeli",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () {
              c.showDetailBottom.value = false;
            },
                child: Text(
                  "Edit Pesanan",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
            )
          ],
        ),
        const Text("Joseph",
            style: TextStyle(fontSize: 14, color: Colors.black87)),

        const SizedBox(height: 15),

        const Text(
          "Rincian Pesanan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // LIST PESANAN (lebih besar)
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: pesanan.length,
            itemBuilder: (context, index) {
              final item = pesanan[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item['title']} x${item['qty']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Rp ${item['price'] * item['qty']}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Pembayaran",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        Obx(() => Row(
          children: [
            Radio<String>(
              value: "sekarang",
              groupValue: c.metodePembayaran.value,
              onChanged: (val) => c.pilihPembayaran(val!),
            ),
            const Text("Bayar Sekarang"),

            const SizedBox(width: 20),

            Radio<String>(
              value: "nanti",
              groupValue: c.metodePembayaran.value,
              onChanged: (val) => c.pilihPembayaran(val!),
            ),
            const Text("Bayar Nanti"),
          ],
        )),

        const SizedBox(height: 10),

        // TOTAL + KONFIRMASI
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

            GestureDetector(
              onTap: () {
                c.konfirmasiPembayaran();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Konfirmasi",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _loadingBottomBar() {
  return Container(
    height: Get.mediaQuery.size.height * 0.20,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget _paymentSuccessBottomBar() {
  return Container(
    height: Get.mediaQuery.size.height * 0.40,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.check_circle, size: 100, color: Colors.green),
        SizedBox(height: 10),
        Text(
          "Pembayaran Telah di konfirmasi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Silahkan melanjutkan pesanan anda",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 20),
        Text("Klik dimana pun untuk melanjutkan",
            style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    ),
  );
}

Widget _paymentPendingBottomBar() {
  return Container(
    height: Get.mediaQuery.size.height * 0.45,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.close, size: 100, color: Colors.red),
        const SizedBox(height: 10),
        const Text(
          "Menunggu Pembayaran",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          "Tambah pesanan atau konfirmasi pembayaran",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 20),

        // tombol tambah
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("+ Tambah",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
            const SizedBox(width: 20),

            // tombol bayar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Bayar",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ],
        ),

        const SizedBox(height: 20),
        const Text("Klik dimana pun untuk melanjutkan",
            style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    ),
  );
}
