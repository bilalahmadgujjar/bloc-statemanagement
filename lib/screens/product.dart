import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

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
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductsLoadedState) {
            int item = state.productsModel.length;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading:Image.network(state.productsModel[index].image),
                  title: Text(state.productsModel[index].title),
                  subtitle: Text(state.productsModel[index].description),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
