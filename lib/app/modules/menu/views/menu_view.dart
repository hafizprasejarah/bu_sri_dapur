import 'package:bu_sri_dapur/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_page_controller.dart';

class MenuView extends GetView<MenuPageController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1DED4),
      appBar: AppBar(
        title: const Text(
          "Menu",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ===== HEADER =====
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Row(
                  children: [
                    GestureDetector(
                      onTap: controller.toggleSelectMode,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black),
                          color: controller.isSelectMode.value
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        child: controller.isSelectMode.value
                            ? const Icon(Icons.check,
                            color: Colors.white, size: 16)
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("Pilih Menu"),
                  ],
                )),
                ElevatedButton.icon(
                  onPressed: () async {
                    
                    Get.toNamed(Routes.TAMBAHMENU);
                  },
                  icon: const Icon(Icons.add, size: 16,color:  Color(0xFFE1DED4),),
                  label: const Text("Tambah",style: TextStyle(color:  Color(0xFFE1DED4)),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF214D3A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                )
              ],
            ),

            const SizedBox(height: 12),

            /// ===== SWITCH =====
            Row(
              children: [
                Obx(() => _tab(
                  "Makanan",
                  controller.selectedView.value == "Makanan",
                      () => controller.selectedView.value = "Makanan",
                )),
                const SizedBox(width: 8),
                Obx(() => _tab(
                  "Minuman",
                  controller.selectedView.value == "Minuman",
                      () => controller.selectedView.value = "Minuman",
                )),
              ],
            ),

            const SizedBox(height: 12),

            /// ===== LIST MENU =====
            Expanded(
              child: Obx(() {
                final list = controller.selectedView.value == "Makanan"
                    ? controller.makanan
                    : controller.minuman;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return Obx(() => _menuCard(
                      id: list[i]["id"],
                      title: list[i]["title"],
                      price: list[i]["price"],
                      image: list[i]["image"],
                      kategori: list[i]["kategori"],
                      checked: controller.selectedView.value == "Makanan"
                          ? controller.selectedMakanan[i]
                          : controller.selectedMinuman[i],
                      onCheck: () => controller.toggleItem(i),
                      showCheck: controller.isSelectMode.value,
                        onEdit: () {
                          Get.toNamed(
                            Routes.EDITMENU,
                            arguments: {
                              'id': list[i]["id"],
                              'title': list[i]["title"],
                              'price': list[i]["price"],
                              'image': list[i]["image"],
                              'kategori': list[i]["kategori"],
                            },

                          );
                          print( list[i]["id"],);
                        },
                    ));
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _tab(String text, bool active, VoidCallback onTap) {
  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      backgroundColor: active ? const Color(0xFF214D3A) : Colors.transparent,
      side: const BorderSide(color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    child: Text(text,
        style: TextStyle(color: active ? Colors.white : Colors.black)),
  );
}

Widget _menuCard({
  required String id,
  required String title,
  required String kategori,
  required int price,
  required String image,
  required bool checked,
  required VoidCallback onCheck,
  required bool showCheck,
  required VoidCallback onEdit,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        if (showCheck)
          GestureDetector(
            onTap: onCheck,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black),
                color: checked ? Colors.green : Colors.transparent,
              ),
              child: checked
                  ? const Icon(Icons.check,
                  color: Colors.white, size: 14)
                  : null,
            ),
          ),
        const SizedBox(width: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, width: 48, height: 48, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("Makanan · Rp. $price",
                  style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        GestureDetector(
          onTap: onEdit,
          child: const Icon(Icons.edit, size: 18),
        ),
      ],
    ),
  );
}
