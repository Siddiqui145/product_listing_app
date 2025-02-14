import 'package:assignment/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  List<Product> allProducts = [];

  ProductBloc(this.repository) : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      allProducts = await repository.fetchProducts();
      emit(ProductLoaded(allProducts));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<ProductState> emit) {
    final filtered = allProducts.where((product) {
      return product.name.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(ProductLoaded(filtered));
  }
}
