
import 'package:bloc_learning_app/bloc/products_bloc.dart';
import 'package:bloc_learning_app/repo/products_repo.dart';
import 'package:bloc_learning_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'debug/bloc_observe.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ProductsBloc(ProductsRepo()),

      /// if i want to call api from the main screen then its use in the bloc
      /// create: (context)=> ProductsBloc()..add(ProductsEventLoaded()),
        /// Material App
      child: const MaterialApp(
          title: 'Flutter Demo',

          home: HomeScreen()),
    );
  }
}
