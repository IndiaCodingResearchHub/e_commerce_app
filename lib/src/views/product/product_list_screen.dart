import 'package:e_commerce_app/src/models/product_model.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_bloc.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_events.dart';
import 'package:e_commerce_app/src/view_model/product_bloc/product_states.dart';
import 'package:e_commerce_app/src/views/home/bottom_navigation_bar.dart';
import 'package:e_commerce_app/src/views/product/product_detail_screen.dart';
import 'package:e_commerce_app/src/widgets/simmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

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
          BlocProvider(create: (_)=>productBloc),
        ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Products'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Implement cart navigation
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>ButtonNavigationBarWidget(tabIndex:1,)),(route) => false);
           
              },
            ),
          ],
        ),
        body: BlocBuilder<ProductBloc,ProductStates>(
           
                        builder:(context,state){
                         
          if( state is LoadingProductState)
          {
           return SimmerLoader.simmerLoaderWidget();
          }
           
          
          else if( state is LoadedProductState)
          {
          
         return 
         AnimationLimiter(
      
           child:  _buildProductList(state.productData),
         );
          }
        
          else {
        return Center(child: const Text("Some Thing Went Wrong2"));
          }
        
          }),
         
        
      
      ),
    );
  }

  Widget _buildProductList(List<ProductPostModels>? productData) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.7, // Adjust the aspect ratio as needed
      ),
      itemCount: productData!.length, // Replace with the actual number of products
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen())),
          child: _buildProductCard(productData,index));
      },
    );
  }

  Widget _buildProductCard(List<ProductPostModels> productData, int index) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(index),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ProductName ${index+1}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
             
                ),
                Text("${productData[index].title}", style: TextStyle(fontSize:12.0, fontWeight: FontWeight.normal,overflow:TextOverflow.ellipsis),
             ),
                SizedBox(height: 4.0),
                Text(
                  'Rs.${(index + 1) * 20.0}',
                  style: TextStyle(color: Colors.blue, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
 
  }

  Widget _buildProductImage(int index) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://img.freepik.com/free-photo/elegant-smartphone-composition_23-2149437106.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph'
                     ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
    );
  }
}







