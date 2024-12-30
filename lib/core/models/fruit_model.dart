class Fruit {
  final String name;
  final String price;
  final String description;
  final String image;

  Fruit({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Fruit(name: $name, price: $price, description: $description, image: $image)';
  }
}
