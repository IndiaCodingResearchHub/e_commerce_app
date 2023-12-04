
import 'package:e_commerce_app/src/views/home/bottom_navigation_bar.dart';
import 'package:e_commerce_app/src/views/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; 


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('E-commerce App'),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBanner(),
            _buildCategories(),
            _buildFeaturedProducts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16),
      child: Center(
        child:productSlider()
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 80,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryItem('Electronics', Icons.devices, Colors.orange),
                _buildCategoryItem('Clothing', Icons.accessibility, Colors.green),
                _buildCategoryItem('Books', Icons.book, Colors.purple),
                // Add more categories as needed
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCategoryItem(String name, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        
        children: [
          Expanded(
      
            child: CircleAvatar(
              backgroundColor: color,
              radius: 50,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProducts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Featured Products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 200,
            child:
             ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                  },
                  child: _buildFeaturedProductItem(
                    'Smartphone',
                    599.99,
                    'https://img.freepik.com/free-vector/female-hand-holding-several-smartphones-different-colors-white-background-vector-illustration_1284-81272.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph',
                              
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                  },
                  child: _buildFeaturedProductItem(
                    'Running Shoes',
                    79.99,
                    'https://img.freepik.com/free-vector/footwear-colored-icons-set_98292-3308.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph',
                  ),
                ),
               GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                  },
                  child: _buildFeaturedProductItem(
                    'Clothes',
                    29.99,
                    'https://img.freepik.com/free-photo/clothing-rack-with-floral-hawaiian-shirts-hangers-hat_23-2149366018.jpg?w=900&t=st=1701342547~exp=1701343147~hmac=55747e50d5f377d6d672a370c8eeb23d4cb9b8ec2c365945dccd6fc759a774ab',
                  
                  ),
                ),
                   GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                  },
                    child: _buildFeaturedProductItem(
                    'Books',
                    29.99,
                    'https://img.freepik.com/free-vector/school-books-elements-set_1284-34322.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph',
                                
                                  ),
                  ),
                // Add more featured products as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProductItem(String name, double price, String imageUrl) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
               Text.rich(TextSpan(
    text: '\u{20B9}502.00\n',
   style: new TextStyle(
          color: Colors.black,
          
        ),
    children: <TextSpan>[
      
     TextSpan(
        text: '\u{20B9} 511.00',
        style: new TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        ),
      ),
     
      TextSpan(
        text:" ",
        style: new TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        ),
      ),
         TextSpan(
        text: ' 2%off',
        style: TextStyle(color: Colors.green, fontSize: 16)
      ),
  
    ],
 ),
)
               
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productSlider(){
  return Padding(padding: EdgeInsets.all(2),
  child:  CarouselSlider( 
              items: [ 
                  
                //1st Image of Slider 
                Container( 
                  margin: EdgeInsets.all(6.0), 
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(8.0), 
                    image: DecorationImage( 
                      image: NetworkImage('https://img.freepik.com/free-vector/female-hand-holding-several-smartphones-different-colors-white-background-vector-illustration_1284-81272.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph',
              ), 
                      fit: BoxFit.cover, 
                       scale: 1.0
                    ), 
                  ), 
                ), 
                  
                //2nd Image of Slider 
                Container( 
                  margin: EdgeInsets.all(6.0), 
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(8.0), 
                    image: DecorationImage( 
                      image: NetworkImage('https://img.freepik.com/free-vector/school-books-elements-set_1284-34322.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph',
              ), 
                      fit: BoxFit.cover, 
                       scale: 1.0
                    ), 
                  ), 
                ), 
                  
                //3rd Image of Slider 
                Container( 
                  margin: EdgeInsets.all(6.0), 
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(8.0), 
                    image: DecorationImage( 
                      image: NetworkImage('https://img.freepik.com/free-photo/clothing-rack-with-floral-hawaiian-shirts-hangers-hat_23-2149366018.jpg?w=900&t=st=1701342547~exp=1701343147~hmac=55747e50d5f377d6d672a370c8eeb23d4cb9b8ec2c365945dccd6fc759a774ab',
                ), 
                      fit: BoxFit.cover, 
                       scale: 1.0
                    ), 

                  ), 
                ), 
                  
                //4th Image of Slider 
                Container( 
                  margin: EdgeInsets.all(6.0), 
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(8.0), 
                    image: DecorationImage( 
                      image: NetworkImage('https://img.freepik.com/free-vector/super-sale-banner-design-vector-illustration_1035-14931.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=sph'), 
                      fit: BoxFit.cover, 
                      scale: 1.0
                    ), 
                  ), 
                ), 
                  
                //5th Image of Slider 
                Container( 
                  margin: EdgeInsets.all(6.0), 
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(8.0), 
                    image: DecorationImage( 
                      image: NetworkImage("https://img.freepik.com/free-vector/arab-bazaar-concept_23-2148676158.jpg?size=626&ext=jpg&ga=GA1.1.912494957.1701336031&semt=ais"), 
                      fit: BoxFit.cover, 
                    ), 
                  ), 
                ), 
  
          ], 
              
            //Slider Container properties 
              options: CarouselOptions( 
                height: 180.0, 
                enlargeCenterPage: true, 
                autoPlay: true, 
                aspectRatio: 16 / 9, 
                autoPlayCurve: Curves.fastOutSlowIn, 
                enableInfiniteScroll: true, 
                autoPlayAnimationDuration: Duration(milliseconds: 800), 
                viewportFraction: 0.8, 
              ), 
          ), 
  );
}


}