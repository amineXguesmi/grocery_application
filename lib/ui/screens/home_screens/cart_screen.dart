import 'package:GroceryApp/ui/presentation/presentation.dart';
import 'package:GroceryApp/ui/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/fake_data/fake_fruits.dart';
import '../../../core/models/fruit_model.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late List<Fruit> fruits;

  @override
  void initState() {
    super.initState();
    fruits = fakeFruits.map((fruitMap) => Fruit.fromMap(fruitMap)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fruits.length - 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index < fruits.length)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Color(0xFFE2E2E2),
                            thickness: 1.0,
                          ),
                        ),
                      CartItemWidget(
                        name: fruits[index].name,
                        price: fruits[index].price,
                        image: fruits[index].image,
                        description: fruits[index].description,
                        onRemove: () {
                          setState(() {
                            fruits.removeAt(index);
                          });
                        },
                        quantity: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: context.height * 0.1,
            padding: const EdgeInsets.only(bottom: 20),
            child: ActionButton(buttonText: 'Go to Checkout', onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
