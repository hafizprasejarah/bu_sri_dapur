import 'package:flutter/material.dart';

class OrderItemCardMinuman extends StatelessWidget {
  final bool isSelected;
  final int quantity;
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final VoidCallback onSelect;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const OrderItemCardMinuman({
    super.key,
    required this.isSelected,
    required this.quantity,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onSelect,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: onSelect,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black, width: 1.5),
                color: isSelected ? Colors.green : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          ),

          SizedBox(width: 10),

          // Gambar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12),

          // Text menu
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$subtitle • Rp. ${price.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Minus
          GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade50,
              ),
              child: Icon(Icons.remove, color: Colors.red, size: 20),
            ),
          ),

          SizedBox(width: 8),

          // Quantity
          Text(
            quantity.toString(),
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          SizedBox(width: 8),

          // Plus
          GestureDetector(
            onTap: onAdd,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.shade50,
              ),
              child: Icon(Icons.add, color: Colors.green, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
