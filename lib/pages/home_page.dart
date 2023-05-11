import 'package:bubble_tea_getx/components/bottom_nav_bar.dart';
import 'package:bubble_tea_getx/models/bubble_tea_shop.dart';
import 'package:bubble_tea_getx/models/drink.dart' show Drink;
import 'package:bubble_tea_getx/pages/cart_page.dart';
import 'package:bubble_tea_getx/pages/order_page.dart';
import 'package:bubble_tea_getx/pages/shop_page.dart';
import 'package:bubble_tea_getx/resources/app_color.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });

    print("Selected index is ${index}");
  }

  //Current Pages
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    //Instansiate the BubbleTea class
    //BubbleTeaShop _bubbleTea = BubbleTeaShop();
    BubbleTeaShop _bubbleTea = Get.find<BubbleTeaShop>();
    //Go to the order Page
    void goToOrderPage(Drink drink) {
      print("This is the ordered drink ${drink.name} ${drink.price}");
      Get.to(() => OrderPage(), arguments: drink);
    }

    return Scaffold(
      //Title of the App here by defining the AppBar
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColor.appBarBgClr,
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
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
