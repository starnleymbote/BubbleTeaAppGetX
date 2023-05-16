import 'package:bubble_tea_getx/models/bubble_tea_shop.dart';
import 'package:bubble_tea_getx/models/drink.dart';
import 'package:bubble_tea_getx/resources/app_color.dart' as AppColor;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  //final Drink drink;
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _orderedDrink = Get.arguments;

  //Initial sweet value
  RxDouble _sweetValue = 0.0.obs;

  //Ice value
  RxDouble _iceValue = 0.0.obs;

  //pearlValue
  RxDouble _pearlValue = 0.0.obs;

  //Update the sweetness value
  void customizeSweetness(double sweet) {
    _sweetValue.value = sweet;
  }

  //Update ice value
  void customizeIce(double ice) {
    _iceValue.value = ice;
  }

  //Update ice value
  void customizePearl(double pearl) {
    _pearlValue.value = pearl;
  }

  //Init Tea shop model
  //BubbleTeaShop _bubbleTea = BubbleTeaShop();
  BubbleTeaShop _myShop = Get.find<BubbleTeaShop>();
  //BubbleTeaShop _myShop = Get.put(BubbleTeaShop());

  //Add the order to Cart
  void addToCart(Drink drink) {
    _myShop.addToCart(drink);

    Get.back();
    Get.snackbar(
      "Bubble Tea App",
      "${drink.name} was added successfully to the cart 🎉",
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.brown.shade400,
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          elevation: 15,
          backgroundColor: AppColor.appBarBgClr,
          title: Text(
            _orderedDrink.name,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Image asset of the ordered drink
              Container(
                height: 350,
                margin: const EdgeInsets.only(
                    top: 0, left: 0, right: 0, bottom: 40),
                child: Image.asset(_orderedDrink.imagePath),
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(65, 55),
                    bottomRight: Radius.elliptical(65, 55),
                  ),
                  border: Border.all(color: Colors.brown.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.shade800,
                      offset: Offset(10, 10),
                      blurRadius: 15,
                    ),
                    BoxShadow(
                        color: Colors.brown.shade50,
                        offset: Offset(-10, -10),
                        blurRadius: 15),
                  ],
                ),
              ),

              //Sliders to customize drinks

              //Sweetness slider
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 70,
                      child: Text("Sweetness"),
                    ),
                    Expanded(
                      child: Obx(
                        () => Slider(
                          autofocus: true,
                          activeColor: AppColor.appBarBgClr,
                          inactiveColor: Colors.brown.shade400,
                          thumbColor: Colors.brown.shade600,
                          divisions: 10,
                          value: _sweetValue.value,
                          label: _sweetValue.value.toString(),
                          onChanged: (sweet) => customizeSweetness(sweet),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Ice slider
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 70,
                      child: Text("Ice"),
                    ),
                    Expanded(
                      child: Obx(
                        () => Slider(
                          autofocus: true,
                          activeColor: AppColor.appBarBgClr,
                          inactiveColor: Colors.brown.shade400,
                          thumbColor: Colors.brown.shade600,
                          divisions: 10,
                          value: _iceValue.value,
                          label: _iceValue.value.toString(),
                          onChanged: (ice) => customizeIce(ice),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Pearl slider
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Text("Pearl"),
                      width: 70,
                    ),
                    Expanded(
                      child: Obx(
                        () => Slider(
                          autofocus: true,
                          activeColor: AppColor.appBarBgClr,
                          inactiveColor: Colors.brown.shade500,
                          thumbColor: Colors.brown.shade600,
                          divisions: 10,
                          value: _pearlValue.value,
                          label: _pearlValue.value.toString(),
                          onChanged: (pearl) => customizePearl(pearl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Order button
              // DecoratedBox(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //       colors: [
              //         Color(0xFF7E481C),
              //         Color(0xFF613613),
              //         Color(0xFF7C4700),
              //         Color(0xFF4B3619),
              //       ],
              //     ),
              //   ),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text("Add To Order"),
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.transparent,
              //         backgroundColor: Colors.transparent,
              //         onSurface: Colors.transparent,
              //         shadowColor: Colors.transparent),
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF7E481C),
                      Color(0xFF613613),
                      Color(0xFF7C4700),
                      Color(0xFF4B3619),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ElevatedButton(
                  onPressed: () => addToCart(_orderedDrink),
                  child: Text("Add To Order"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
