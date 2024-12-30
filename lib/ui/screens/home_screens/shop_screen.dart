import 'package:GroceryApp/core/fake_data/fake_fruits.dart';
import 'package:GroceryApp/ui/presentation/presentation.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_search_text_field.dart';
import '../../widgets/grocery_item_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
            ),
            Center(
                child: Image.asset(
                  AppIcons.coloredLogoIcon,
                  scale: 1.15,
                )),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  "Dhaka, Banassre",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF4C4F4D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SearchTextField(
              controller: _searchController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Exclusive Offer",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xFF181725),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: fakeFruits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  final item = fakeFruits[index];
                  return GroceryItemWidget(
                    name: item['name']!,
                    price: item['price']!,
                    image: item['image']!,
                    description: item['description']!,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
