import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/re_order_controller.dart';

class ReOrderView extends GetView<ReOrderController> {
  const ReOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Widget _orderDetailBottomBar() {
//   final c = Get.find<PesananController>();
//
//   final pesanan = c.getSelectedItems(); // list pesanan
//
//   return Container(
//     padding: const EdgeInsets.all(20),
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(24),
//         topRight: Radius.circular(24),
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black26,
//           blurRadius: 6,
//           offset: Offset(0, -3),
//         )
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Nama Pembeli",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             TextButton(onPressed: () {
//               c.showDetailBottom.value = false;
//             },
//               child: Text(
//                 "Edit Pesanan",
//                 style: TextStyle(
//                   fontSize: 12,
//                 ),
//               ),
//             )
//           ],
//         ),
//         const Text("Joseph",
//             style: TextStyle(fontSize: 14, color: Colors.black87)),
//
//         const SizedBox(height: 15),
//
//         const Text(
//           "Rincian Pesanan",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//
//
//         Expanded(
//           child: ListView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: pesanan.length,
//             itemBuilder: (context, index) {
//               final item = pesanan[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${item['title']} x${item['qty']}",
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                     Text(
//                       "Rp ${item['price'] * item['qty']}",
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//
//         const SizedBox(height: 10),
//
//         const Text(
//           "Pembayaran",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//
//         Obx(() => Row(
//           children: [
//             Radio<String>(
//               value: "sekarang",
//               groupValue: c.metodePembayaran.value,
//               onChanged: (val) => c.pilihPembayaran(val!),
//             ),
//             const Text("Bayar Sekarang"),
//
//             const SizedBox(width: 20),
//
//             Radio<String>(
//               value: "nanti",
//               groupValue: c.metodePembayaran.value,
//               onChanged: (val) => c.pilihPembayaran(val!),
//             ),
//             const Text("Bayar Nanti"),
//           ],
//         )),
//
//         const SizedBox(height: 10),
//
//         // TOTAL + KONFIRMASI
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Total",
//                   style: TextStyle(fontSize: 12, color: Colors.black54),
//                 ),
//                 Text(
//                   "Rp ${c.totalHarga}",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 c.konfirmasiPembayaran();
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: const Text(
//                   "Konfirmasi",
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }