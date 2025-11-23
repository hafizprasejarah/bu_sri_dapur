import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.backgroundColor,
      body: SafeArea(
        child:Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                //Text
                const Text("Welcome To Dapur Bu Sri",style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF234E3B),
                  letterSpacing: 1.0,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
