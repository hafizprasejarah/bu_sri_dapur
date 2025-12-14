import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambahmenu_controller.dart';

class TambahmenuView extends GetView<TambahmenuController> {
  const TambahmenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1DED4),
      appBar: AppBar(
        title: Text("Tambah Menu", style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Menu",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Nama Menu",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Harga",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Masukkan Harga",
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kategori",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: controller.kategori.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            ),
                            items: const [
                              DropdownMenuItem(value: "Makanan", child: Text("Makanan")),
                              DropdownMenuItem(value: "Minuman", child: Text("Minuman")),
                            ],
                            onChanged: (v) {
                              if (v != null) controller.kategori.value = v;
                            },
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),

    );
  }
}
