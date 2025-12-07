import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          child: child!,
        );
      },
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
