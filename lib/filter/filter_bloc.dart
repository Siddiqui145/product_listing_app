import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState());

  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is UpdateFilter) {
      yield state.copyWith(
        category: event.category,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      );
    }
  }
}
