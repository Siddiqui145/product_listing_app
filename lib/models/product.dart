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
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}
