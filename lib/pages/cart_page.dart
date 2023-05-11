import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/drink_tile.dart';
import '../models/bubble_tea_shop.dart';
import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Instansiate the BubbleTea class
  //BubbleTeaShop _bubbleTea = BubbleTeaShop();

  BubbleTeaShop _bubbleTea = Get.put<BubbleTeaShop>(BubbleTeaShop());

  void removeFromCart(Drink drink) {
    _bubbleTea.removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade200,
      child: ListView.builder(
        itemCount: _bubbleTea.cart == null ? 0 : _bubbleTea.cart.length,
        itemBuilder: (context, index) {
          Drink individualDrink = _bubbleTea.cart[index];

          return DrinkTile(
              onTap: () => removeFromCart(individualDrink),
              name: individualDrink.name,
              imagePath: individualDrink.imagePath,
              price: individualDrink.price);
        },
      ),
    );
  }
}
