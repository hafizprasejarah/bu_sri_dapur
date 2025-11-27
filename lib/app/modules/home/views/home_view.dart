import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Jonny", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),

          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Text("Search"),
              ],
            ),
          ),

          SizedBox(height: 20),

          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1)],
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: Text("See full menu")),
            ],
          ),

          // GridView.count(
          //   crossAxisCount: 2,
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   childAspectRatio: 0.75,
          //   children: List.generate(4, (index) => FoodCard()),
          // )
        ],
      ),
    );
  }
}