import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<UpdateFilter>((event, emit) {
      emit(state.copyWith(
        category: event.category,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      ));
    });
  }
}
