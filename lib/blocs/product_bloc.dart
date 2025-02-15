import 'package:assignment/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../repositories/product_repository.dart';
import '../filter/filter_bloc.dart';
import '../filter/filter_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  final FilterBloc filterBloc;
  late Stream<FilterState> filterStream;
  List<Product> allProducts = [];

  ProductBloc(this.repository, this.filterBloc) : super(ProductLoading()) {
    filterStream = filterBloc.stream;
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);

    filterStream.listen((filterState) {
      add(LoadProducts());
    });
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      allProducts = await repository.fetchProducts();
      final filteredProducts = allProducts.where((product) {
        final matchesCategory = filterBloc.state.category.isEmpty || product.name.toLowerCase().contains(filterBloc.state.category.toLowerCase());
        final matchesPrice = product.price >= filterBloc.state.minPrice && product.price <= filterBloc.state.maxPrice;
        return matchesCategory && matchesPrice;
      }).toList();
      emit(ProductLoaded(filteredProducts));
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
