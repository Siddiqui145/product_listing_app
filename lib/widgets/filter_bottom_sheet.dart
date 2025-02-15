import 'package:assignment/filter/filter_bloc.dart';
import 'package:assignment/filter/filter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(0, 500);
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter by Price', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 500,
            divisions: 50,
            labels: RangeLabels('\$${_priceRange.start.toStringAsFixed(2)}', '\$${_priceRange.end.toStringAsFixed(2)}'),
            onChanged: (values) {
              setState(() => _priceRange = values);
            },
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Category'),
            onChanged: (value) {
              category = value;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<FilterBloc>().add(UpdateFilter(
                    category: category,
                    minPrice: _priceRange.start,
                    maxPrice: _priceRange.end,
                  ));
              Navigator.pop(context);
            },
            child: const Text('Apply Filter'),
          ),
        ],
      ),
    );
  }
}
