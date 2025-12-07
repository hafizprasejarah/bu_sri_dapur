import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class DrinkSliderLoop extends StatefulWidget {
  const DrinkSliderLoop({super.key});

  @override
  State<DrinkSliderLoop> createState() => _DrinkSliderLoopState();
}

class _DrinkSliderLoopState extends State<DrinkSliderLoop> {
  final  CarouselSliderController buttonCarouselController = CarouselSliderController();
  final GlobalKey sliderKey = GlobalKey(); // 👉 fixed key

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Cappucino","price": "Rp 18.000","image": "assets/images/cappucino.jpg"},
    {"title": "Coffe Latte","price": "Rp 12.000","image": "assets/images/coffe_latte.jpg"},
    {"title": "Cold Brew","price": "Rp 20.000","image": "assets/images/cold_brew.jpg"},
    {"title": "Iced Americano","price": "Rp 15.000","image": "assets/images/iced_americano.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      key: sliderKey,
      itemCount: menuItems.length,
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 260,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        viewportFraction: 0.7,
      ),
      itemBuilder: (context, index, realIndex) {
        final item = menuItems[index];
        return _buildCard(item);
      },
    );
  }

  Widget _buildCard(Map item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              item["image"],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["title"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(item["price"], style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
