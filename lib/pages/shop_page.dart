import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/drink_tile.dart';
import '../models/bubble_tea_shop.dart';
import '../models/drink.dart';
import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    //Instansiate the BubbleTea class
    BubbleTeaShop _bubbleTea = BubbleTeaShop();

    //Go to the order Page
    void goToOrderPage(Drink drink) {
      print("This is the ordered drink ${drink.name} ${drink.price}");
      Get.to(() => OrderPage(), arguments: drink);
    }

    return Container(
      color: Colors.brown.shade200,
      child: ListView.builder(
        itemCount: _bubbleTea == null ? 0 : _bubbleTea.bubble_tea_shop.length,
        itemBuilder: (context, index) {
          Drink individualDrink = _bubbleTea.bubble_tea_shop[index];

          return DrinkTile(
            onTap: () => goToOrderPage(individualDrink),
            name: individualDrink.name,
            imagePath: individualDrink.imagePath,
            price: individualDrink.price,
            trailing: Icon(Icons.arrow_forward, color: Colors.brown.shade50),
          );
        },
      ),
    );
  }
}
