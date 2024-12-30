import 'package:GroceryApp/ui/screens/product_details/grocery_details_screen.dart';
import 'package:flutter/material.dart';

import '../../core/models/fruit_model.dart';
import '../presentation/presentation.dart';

class GroceryItemWidget extends StatelessWidget {
  const GroceryItemWidget({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.index,
  });

  final String name;
  final String price;
  final String image;
  final String description;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => GroceryDetailScreen(
                          fruit: Fruit(
                            name: name,
                            price: price,
                            image: image,
                            description: description,
                          ),
                          index: index,
                        ),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 500), // Adjust duration if needed
                      ),
                    );
                  },
                  child: Hero(
                    tag: image + index.toString(),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
