import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsEventLoaded());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Product Screen"),
        ),

        /// =======================================
        /// ITs is the bloc, Bloc Builder, Bloc Repo, Bloc Repo example
        /// =======================================

        // body: BlocBuilder<ProductsBloc, ProductsState>(
        //   builder: (context, state) {
        //     if (state is ProductsLoadingState) {
        //       return Center(child: CircularProgressIndicator.adaptive());
        //     } else if (state is ProductsLoadedState) {
        //
        //       return ListView.builder(
        //         itemCount:  state.productsModel.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             leading:Image.network(state.productsModel[index].image),
        //             title: Text(state.productsModel[index].title),
        //             subtitle: Text(state.productsModel[index].description),
        //           );
        //         },
        //       );
        //     } else if (state is ProductsErrorState) {
        //       return Center(child: Text(state.errorMessage));
        //     } else {
        //       return SizedBox();
        //     }
        //   },
        // ),
        //

        /// =======================================
        /// ITs is the bloc listener example (its use only for like listen activity in it
        /// =======================================

        body: BlocListener<ProductsBloc, ProductsState>(
          listener: (context, state) {
           if(state is ProductsLoadedState)
             {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Loaded')));

             }
           else if (state is ProductsErrorState)
             {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data not Loaded')));
             }
          },
          child: Center(child: Text('Product Data'),),
        )


    );
  }
}
