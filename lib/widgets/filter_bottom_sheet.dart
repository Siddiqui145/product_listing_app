import 'package:assignment/filter/filter_bloc.dart';
import 'package:assignment/filter/filter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  FilterBottomSheetState createState() => FilterBottomSheetState();
}

class FilterBottomSheetState extends State<FilterBottomSheet> {
  String _selectedCategory = 'All';
  double _minPrice = 0.0;
  double _maxPrice = 1000.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            items: ['All', 'Electronics', 'Clothing', 'Home']
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
            decoration: InputDecoration(labelText: 'Category'),
          ),
          RangeSlider(
            values: RangeValues(_minPrice, _maxPrice),
            min: 0,
            max: 1000,
            divisions: 20,
            labels: RangeLabels(
              '\$${_minPrice.toStringAsFixed(0)}',
              '\$${_maxPrice.toStringAsFixed(0)}',
            ),
            onChanged: (values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<FilterBloc>().add(UpdateFilter(
                    category: _selectedCategory,
                    minPrice: _minPrice,
                    maxPrice: _maxPrice,
                  ));
              Navigator.of(context).pop();
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
