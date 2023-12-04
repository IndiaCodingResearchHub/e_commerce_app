import 'package:e_commerce_app/src/models/product_model.dart';
import 'package:equatable/equatable.dart';





abstract class ProductStates extends Equatable{
  const ProductStates();

  @override
  List<Object?> get props=>[];

}

class InitialProductState extends ProductStates{}

class LoadingProductState extends ProductStates{}


//state

// ignore: must_be_immutable
class LoadedProductState extends ProductStates{

  List<ProductPostModels>? productData=[];

  LoadedProductState({this.productData});
}

// ignore: must_be_immutable
class ErrorProductState extends ProductStates{
  String message="";
  ErrorProductState({required this.message});
}



