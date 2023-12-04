import 'package:e_commerce_app/src/view_model/product_bloc/product_events.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_repository.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEvents,ProductStates> {
  ProductBloc() : super(InitialProductState()) {
    final ProductRepository productRepository = ProductRepository();

    on<ProductEvent>((event, state) async {
      try {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadingProductState());
        final mList = await productRepository.fetchProductPost();

        // ignore: invalid_use_of_visible_for_testing_member
        emit(LoadedProductState(productData: mList));
      } on NetworkErrorProduct {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ErrorProductState(message: "Some thing went wrong !"));
      }
    });

    
  }
}
