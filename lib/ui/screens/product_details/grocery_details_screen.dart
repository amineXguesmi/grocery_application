import 'package:GroceryApp/core/models/fruit_model.dart';
import 'package:GroceryApp/ui/presentation/presentation.dart';
import 'package:flutter/material.dart';

class GroceryDetailScreen extends StatefulWidget {
  const GroceryDetailScreen({super.key, required this.fruit, required this.index});

  final Fruit fruit;
  final int index;

  @override
  State<GroceryDetailScreen> createState() => _GroceryDetailScreenState();
}

class _GroceryDetailScreenState extends State<GroceryDetailScreen> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroImage(),
            const SizedBox(height: 20),
            _titleWithFavoriteIcon(),
            _productDescription(),
            const SizedBox(height: 20),
            _quantitySelector(),
            const SizedBox(height: 20),
            _productDetailsHeader(),
            _productInformation(),
            const Text(
              "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 28),
            _nutritionFacts(),
            const SizedBox(height: 8),
            _reviewSection(),
            _addToBasketButton(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _heroImage() {
    return Hero(
      tag: '${widget.fruit.image}${widget.index}',
      child: Center(
        child: Image.asset(
          widget.fruit.image,
          height: 200,
        ),
      ),
    );
  }

  Widget _titleWithFavoriteIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Naturel Red Apple",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _productDescription() {
    return Text(
      widget.fruit.description,
      style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
    );
  }

  Widget _quantitySelector() {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                size: 28,
              ),
              onPressed: _decrementQuantity,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                _quantity.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColors.primaryColor,
                size: 28,
              ),
              onPressed: _incrementQuantity,
            ),
          ],
        ),
        const Spacer(),
        Text(
          widget.fruit.price,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _productDetailsHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Product Detail",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          size: 30,
          weight: 5,
        ),
      ],
    );
  }

  Widget _productInformation() {
    return const SizedBox(height: 8);
  }

  Widget _nutritionFacts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Nutritions",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "100 g",
                style: TextStyle(color: Color(0xFF7C7C7C)),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ],
    );
  }

  Widget _reviewSection() {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Review",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.orange),
          Icon(Icons.star, color: Colors.orange),
          Icon(Icons.star, color: Colors.orange),
          Icon(Icons.star, color: Colors.orange),
          Icon(Icons.star_border, color: Colors.orange),
        ],
      ),
    );
  }

  Widget _addToBasketButton() {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Center(child: ActionButton(buttonText: "Add To Basket")));
  }
}
