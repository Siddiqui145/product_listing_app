import 'dart:convert';
import 'package:assignment/models/product.dart';
import 'package:http/http.dart' as http;
class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('https://example.com/data.json'); 
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['products'] as List;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
