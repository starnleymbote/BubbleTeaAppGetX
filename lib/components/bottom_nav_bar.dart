import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;

  BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: GNav(
          onTabChange: (value) => widget.onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          activeColor: Colors.brown.shade500,
          color: Colors.brown.shade300,
          tabActiveBorder: Border.all(color: Colors.brown),
          haptic: true,
          backgroundColor: Colors.brown.shade200,
          tabs: [
            //Shop tabs
            GButton(
              haptic: true,
              icon: Icons.home,
              iconSize: 20,
              text: "Coffee",
            ),

            //Cart tabs
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
              iconSize: 20,
            ),
          ]),
    );
  }
}
