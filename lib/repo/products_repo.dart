import 'package:http/http.dart' as http;

import '../models/product_models.dart';

class ProductsRepo {
  Future<List<ProductsModel>> getProductList() async {
    try {
      var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final productsModel = productsModelFromJson(response.body);
        return productsModel;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
