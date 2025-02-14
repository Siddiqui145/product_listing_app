import 'dart:convert';

class Product {
  final String name;
  final double price;
  final double rating;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.image,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
}
static List<Product> fromJsonList(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);
    return data.map((item) => Product.fromJson(item)).toList();
  }
}