import 'package:bu_sri_dapur/app/modules/home/components/slider-menu-makanan.dart';
import 'package:bu_sri_dapur/app/modules/home/components/slider-menu-minuman.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textColor = Color(0xFFE1DED4);
    final Color backgroundColor = const Color(0xFFD9D9D9);
    final Color buttonColor = const Color(0xFF254F3C);
    var isHidden = true.obs;

    void toggleVisibility() {
      isHidden.value = !isHidden.value;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dapur Bu Sri", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF214D3A),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueGrey.shade100,
                        backgroundImage: AssetImage('assets/images/Admin.jpg')
                      ),
                      SizedBox(width: 30),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Admin Ireng",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "ID",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width ,
                    height: 1.5,
                    color: textColor,
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total pendapatan",
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.credit_card, color: textColor, size: 20),
                            SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                child: Obx(() {
                                  return Text(
                                   isHidden.value ? "●●●●●●●●" : "Rp. 100.000,00",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },)
                              ),
                            ),

                            SizedBox(width: 5),
                            Obx(() {
                              return IconButton(
                                  icon: Icon(
                                    color: textColor,
                                    isHidden.value?
                                    Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: toggleVisibility
                              );
                            },)
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 15),

                  // Garis pemisah
                  Container(
                    width: 1.5,
                    height: 70,
                    color: textColor,
                  ),

                  SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dilayani :",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.person, color: textColor, size: 25),
                            SizedBox(width: 10),
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ),

        SizedBox(height: 20),

          Container(
            // height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),onChanged: (value) => controller.updateSearch(value),
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Makanan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: Text(
                  "See full Menu",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: const MenuSliderLoop(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Minuman",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: Text(
                  "See full Menu",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: const DrinkSliderLoop(),
          )


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