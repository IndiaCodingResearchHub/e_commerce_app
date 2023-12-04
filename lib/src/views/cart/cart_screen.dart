import 'package:e_commerce_app/src/view_model/product_bloc/product_bloc.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_events.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_states.dart';
import 'package:e_commerce_app/src/views/cart/cart_item_card.dart';
import 'package:e_commerce_app/src/views/checkout/checkout_screen.dart';
import 'package:e_commerce_app/src/widgets/simmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


ProductBloc productBloc=ProductBloc();

@override
  void initState() {
  productBloc.add(ProductEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>productBloc)
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Shopping Cart'),
        ),
        body:  BlocBuilder<ProductBloc,ProductStates>(
             
                          builder:(context,state){
                           
            if( state is LoadingProductState)
            {
             return SimmerLoader.simmerLoaderWidget();
            }
             
            
            else if( state is LoadedProductState)
            {
            
           return 
           AnimationLimiter(
        
             child:  ListView.builder(
          physics:BouncingScrollPhysics(),
          itemCount: state.productData!.length, // Replace with the actual number of cart items
          itemBuilder: (context, index) {
            return 
            
             AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 300),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
                child:CartItemCard(
              imgUrl: 'https://img.freepik.com/free-photo/drawing-fabric_1098-18012.jpg?w=900&t=st=1701336167~exp=1701336767~hmac=f0357275c02ae2a4cba7e63c6f653dea9c0cc6463bb2cbedc34fa5b3323c7cb0',
              itemName: 'Product ${index+1}',
              itemPrice: 25.99,
              quantity: 2,
            )
          ),
        ),
      );
            
          },
        ),
       
           );
            }
          
            else {
          return Center(child: const Text("Some Thing Went Wrong2"));
            }
          
            }),
           
          
        
        
        
       
       
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:\u{20B9}129.95', style: TextStyle(fontSize: 18)),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout logic
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen()));
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}