import 'package:bubble_tea_getx/models/drink.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BubbleTeaShop extends GetxController {
  //List of Drinks for sale
  final List<Drink> bubble_tea_shop = [
    Drink(
        name: "Swiss Berry Latte",
        imagePath: "images/swiss_berry.png",
        price: 120.0),
    Drink(
        name: "Power Plant", imagePath: "images/power_plant.png", price: 110.0),
    Drink(
        name: "Java Cooler", imagePath: "images/java_cooler.png", price: 230.0),
    Drink(name: "Iced Latte", imagePath: "images/iced_latte.png", price: 270.0),
    Drink(
        name: "Coffee Late", imagePath: "images/coffee_late.png", price: 210.0),
    Drink(name: "Caramel", imagePath: "images/caramel.png", price: 400.0),
    Drink(
        name: "New Caramel Double",
        imagePath: "images/caramel.png",
        price: 450.0),
    Drink(name: "Blue Mango", imagePath: "images/blue_mango.png", price: 370.0),
    Drink(
        name: "Espresso Cooler",
        imagePath: "images/espresso_cooler.png",
        price: 250.0),
  ];

  //list all drinks in users cart
  final List<Drink> _userCart = [];

  //get user cart
  List<Drink> get cart => _userCart;

  //Add drinks to the cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    //update();
  }
  //User Adding a drink to the cart

  //User removing a drink from the cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    update();
  }

  //Get drinks from the cart
}
