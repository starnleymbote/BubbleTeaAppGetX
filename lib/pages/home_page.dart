import 'package:bubble_tea_getx/models/bubble_tea_shop.dart';
import 'package:bubble_tea_getx/models/drink.dart' show Drink;
import 'package:flutter/material.dart';

import '../components/drink_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Instansiate the BubbleTea class
    BubbleTeaShop _bubbleTea = BubbleTeaShop();

    return Scaffold(
      //Title of the App here by defining the AppBar
      appBar: AppBar(
        elevation: 15,
        backgroundColor: Colors.brown.shade800,
        title: const Text(
          "Bubble Tea",
          style: TextStyle(
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      //List of drinks to be sold here
      body: Container(
        color: Colors.brown.shade200,
        child: ListView.builder(
          itemCount: _bubbleTea == null ? 0 : _bubbleTea.bubble_tea_shop.length,
          itemBuilder: (context, index) {
            Drink individualDrink = _bubbleTea.bubble_tea_shop[index];

            return DrinkTile(
                name: individualDrink.name,
                imagePath: individualDrink.imagePath,
                price: individualDrink.price);
          },
        ),
      ),
    );
  }
}
