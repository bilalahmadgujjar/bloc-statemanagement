
import 'package:bloc_learning_app/bloc/products_bloc.dart';
import 'package:bloc_learning_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ProductsBloc()..add(ProductsEventLoaded()),
        /// Material App
      child: const MaterialApp(
          title: 'Flutter Demo',

          home: HomeScreen()),
    );
  }
}
