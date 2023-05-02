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
    return Container(child: Text("Hello there"));
  }
}
