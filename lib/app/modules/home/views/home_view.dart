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
                      SizedBox(width: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Admin Ireng",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "ID",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width ,
                    height: 1,
                    color: textColor,
                  ),
                  SizedBox(height: 30),
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
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(Icons.credit_card, color: textColor, size: 20),
                            SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Rp. 100.000,00",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                            SizedBox(width: 5),
                            Icon(Icons.visibility_off, color: textColor, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 15),

                  // Garis pemisah
                  Container(
                    width: 1.5,
                    height: 90,
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
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.person, color: textColor, size: 30),
                            SizedBox(width: 10),
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 22,
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child:
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>{},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:  BorderSide(
                              color: textColor,
                              width: 1
                          )
                      ),
                    ),
                    child:  Text(
                      "Tambah Menu",
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
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