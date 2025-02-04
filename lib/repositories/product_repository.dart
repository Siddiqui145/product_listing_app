import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await rootBundle.loadString('assets/data.json');
      return Product.fromJsonList(response);
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
