import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to load products"));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filteredProducts = (state as ProductLoaded)
          .products
          .where((p) => p.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductLoaded(filteredProducts));
    }
  }
}
