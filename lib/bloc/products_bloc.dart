import 'package:bloc/bloc.dart';
import 'package:bloc_learning_app/repo/products_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../models/product_models.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEventLoaded, ProductsState> {
  final ProductsRepo productsRepo;

  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsEventLoaded>((event, emit) async {
      try {
        emit(ProductsLoadingState());

        var data = await productsRepo.getProductList();
        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
