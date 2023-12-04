







import 'package:e_commerce_app/src/models/product_model.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_api_provider.dart';

class ProductRepository{

 final  _provider=ProductApiProvider();


  Future<List<ProductPostModels>> fetchProductPost(){
    return _provider.getProductPosts();
  }
}


class NetworkErrorProduct extends Error {}