import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import '../models/product_models.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEventLoaded, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsEventLoaded>((event, emit) async{
   try{
     emit(ProductsLoadingState());
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    print(response.body);
     if(response.statusCode==200)
       {
         final productsModel = productsModelFromJson(response.body);
         emit(ProductsLoadedState(productsModel));

       }

     else
       {
         throw Exception("Failed to load products");
       }



   }catch(e)
      {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
