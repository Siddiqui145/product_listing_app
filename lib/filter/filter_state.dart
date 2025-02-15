import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final String category;
  final double minPrice;
  final double maxPrice;

  const FilterState({
    this.category = '',
    this.minPrice = 0.0,
    this.maxPrice = double.infinity,
  });

  FilterState copyWith({
    String? category,
    double? minPrice,
    double? maxPrice,
  }) {
    return FilterState(
      category: category ?? this.category,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  @override
  List<Object> get props => [category, minPrice, maxPrice];
}
