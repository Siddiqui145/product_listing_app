import 'dart:convert';
import 'package:assignment/models/product.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data.json');
      final data = json.decode(jsonString)['products'] as List;
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: ${e.toString()}');
    }
  }
}
