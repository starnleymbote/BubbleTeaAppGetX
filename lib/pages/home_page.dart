import 'package:bubble_tea_getx/models/bubble_tea_shop.dart';
import 'package:bubble_tea_getx/resources/app_color.dart' as AppColors;
import 'package:flutter/material.dart';

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
        backgroundColor: AppColors.appBarBgClr,
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
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            print("This is the list of drinks  ${_bubbleTea}");
            //return DrinkTile(name: name, imagePath: imagePath, price: price);
          },
        ),
      ),
    );
  }
}
