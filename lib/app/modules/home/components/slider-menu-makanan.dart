import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MenuSliderLoop extends StatefulWidget {
  const MenuSliderLoop({super.key});

  @override
  State<MenuSliderLoop> createState() => _MenuSliderLoopState();
}
class _MenuSliderLoopState extends State<MenuSliderLoop> {

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Nasi Goreng",
        "price": "Rp 18.000",
        "image": "assets/images/Nasi Goreng.jpg"
      },
      {
        "title": "Mie Ayam",
        "price": "Rp 12.000",
        "image": "assets/images/Mie Ayam.jpg"
      },
      {
        "title": "Sate Ayam",
        "price": "Rp 20.000",
        "image": "assets/images/Sate Ayam.jpg"
      },
      {
        "title": "Bakso",
        "price": "Rp 15.000",
        "image": "assets/images/bakso.jpg"
      },
    ];

    return CarouselSlider.builder(
      itemCount: menuItems.length,
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        viewportFraction: 0.7,
      ),
      itemBuilder: (context, index, realIndex) {
        final item = menuItems[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  item["image"],
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      item["price"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
