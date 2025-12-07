import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../componets/card.dart';
import '../controllers/pemesanan_controller.dart';

class PemesananView extends GetView<PemesananController> {
  const PemesananView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E1D5),
      appBar: AppBar(
        title: Text("Pesanan", style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            OrderCard(
              name: "Josep Bringas",
              table: "12",
              isPaid: false,
              total: 24000,
              items: [
                {"name": "Soto", "price": 6000, "qty": 2},
                {"name": "Es Teh", "price": 6000, "qty": 2},
              ],
            ),

            OrderCard(
              name: "Josep Bringas",
              table: "12",
              isPaid: true,
              total: 24000,
              items: [
                {"name": "Soto", "price": 6000, "qty": 2},
                {"name": "Es Teh", "price": 6000, "qty": 2},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
