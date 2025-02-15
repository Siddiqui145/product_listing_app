import 'package:equatable/equatable.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateFilter extends FilterEvent {
  final String category;
  final double minPrice;
  final double maxPrice;

  const UpdateFilter({
    required this.category,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  List<Object> get props => [category, minPrice, maxPrice];
}
