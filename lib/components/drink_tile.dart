import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;

  const DrinkTile(
      {Key? key,
      required this.name,
      required this.imagePath,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.brown.shade700,
              offset: Offset(4, 4),
              spreadRadius: 1,
              blurRadius: 15),
          BoxShadow(
              color: Colors.brown.shade200,
              offset: Offset(-4, -4),
              spreadRadius: 1,
              blurRadius: 15),
        ],
        color: Colors.brown.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: SizedBox(
          height: 60,
          width: 80,
          child: Image.asset(this.imagePath),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
          child: Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        subtitle: Text(
          this.price.toString(),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.brown.shade50),
      ),
    );
  }
}
