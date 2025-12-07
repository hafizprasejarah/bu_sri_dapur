import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String name;
  final String table;
  final List<Map<String, dynamic>> items;
  final int total;
  final bool isPaid;

  const OrderCard({
    super.key,
    required this.name,
    required this.table,
    required this.items,
    required this.total,
    required this.isPaid,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isPaid ? Colors.green : Colors.red;
    final Color statusColor = isPaid ? Colors.green : Colors.red;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "No. $table",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Text(
                isPaid ? "Sudah bayar" : "Belum bayar",
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // List Pesanan
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item["name"],style: TextStyle(),),
                  Text("Rp. ${item["price"]}  x${item["qty"]}"),
                ],
              );
            }).toList(),
          ),

          SizedBox(height: 12),
          Divider(),
          SizedBox(height: 8),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "Rp. $total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Tombol hanya muncul jika belum bayar
          if (!isPaid)
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text("+ Pesanan"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text("Bayar"),
                ),
              ],
            )
        ],
      ),
    );
  }
}
