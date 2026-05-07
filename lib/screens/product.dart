import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Product Screen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const ListTile();
      }),
    );
  }
}
