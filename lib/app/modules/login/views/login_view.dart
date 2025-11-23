import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: controller.backgroundColor,
      body: SafeArea(
        child:Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                //Text
                const Text("DAPUR BU SRI",style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF254F3C),
                  letterSpacing: 1.0,
                ),),

                const SizedBox(height: 30,),

                //PROFILE
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blueGrey.shade100,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: controller.buttonColor,
                  ),
                ),

                const SizedBox(height: 30,),

                // Username Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Username",
                      contentPadding: EdgeInsets.symmetric(horizontal: 20)
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Password  Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Obx((){
                    return TextField(
                      obscureText: controller.isPasswordHidden.value,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                        suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordHidden.value?
                              Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: controller.togglePasswordVisibility
                        ),
                      ),
                    );
                  })
                ),

                const SizedBox(height: 25,),
                // Button Masuk
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.togglePasswordVisibility,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
