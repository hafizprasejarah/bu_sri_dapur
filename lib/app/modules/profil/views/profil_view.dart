import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1DED4),
      appBar: AppBar(
        title: Text("Profil", style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            profileAdmin(),

            const SizedBox(height: 20,),

            Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    _menuItem("Ubah Profil", () {}),
                    _divider(),
                    _menuItem("Ganti Sandi", () {}),
                    _divider(),
                    _menuItem("Ketentuan", () {}),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 20),

            Padding(padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: logout firebase
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Keluar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Widget profileAdmin () {
  return Column(
    children: [
      CircleAvatar(
        radius: 50,
        backgroundColor: Colors.blueGrey.shade100,
        backgroundImage:
        AssetImage('assets/images/Admin.jpg'),
      ),

      SizedBox(height: 8),

      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Admin Ireng",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              "ID : ID_001",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ]),
    ],
  );
}


Widget _menuItem(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF2F5D50),
      ),
    ),
    onTap: onTap,
  );
}

Widget _divider() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(height: 1),
  );
}