import 'package:assignment/blocs/product_bloc.dart';
import 'package:assignment/blocs/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/product_repository.dart';
import 'screens/home_screen.dart';

void main() {
  final productRepository = ProductRepository();
  runApp(
    BlocProvider(
      create: (_) => ProductBloc(productRepository)..add(LoadProducts()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
