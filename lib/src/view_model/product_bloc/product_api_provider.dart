import 'dart:convert';
import 'package:e_commerce_app/src/models/product_model.dart';
import 'package:e_commerce_app/src/services/api_service.dart';
import 'package:http/http.dart' as http;


class ProductApiProvider {
List <ProductPostModels> productData=[];
  Future<List<ProductPostModels>> getProductPosts() async {

   
    http.Response res = await http.get(Uri.parse(Apis.postsAPIUrl));

    try{
    if(res.statusCode==200){
     String responseBody =res.body;
     var jsonBody=json.decode(responseBody);

 


for(var data in jsonBody){
productData.add(ProductPostModels(id: data["id"], userId: data["userId"], title: data["title"], body: data["body"]));
}
return productData;
    }else{
      return productData;
    }

      
    }
    catch(e,stacktrace){
     
      print("Exception occured: $e stackTrace: $stacktrace");
      return productData;
    }
  }


}
