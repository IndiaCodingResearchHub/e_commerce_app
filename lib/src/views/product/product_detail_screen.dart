import 'package:e_commerce_app/src/views/home/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProductImageCarousel(),
            _buildProductDetails(),
            _buildDescription(),
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImageCarousel() {
    return Container(
      height: 300,
      child: PageView(
        children: [
          _buildImage('https://img.freepik.com/free-photo/3d-workstation-with-computer-peripheral-devices_23-2150714189.jpg?t=st=1701336071~exp=1701339671~hmac=e03855bddf9d5a45ce5542d561a874eb4ca3df1a3be6398dc32e1c3f02f9238b&w=740'),
          _buildImage('https://img.freepik.com/free-photo/drawing-fabric_1098-18012.jpg?w=900&t=st=1701336167~exp=1701336767~hmac=f0357275c02ae2a4cba7e63c6f653dea9c0cc6463bb2cbedc34fa5b3323c7cb0'),
          _buildImage('https://img.freepik.com/free-photo/drawing-fabric_1098-18012.jpg?w=900&t=st=1701336167~exp=1701336767~hmac=f0357275c02ae2a4cba7e63c6f653dea9c0cc6463bb2cbedc34fa5b3323c7cb0'),
        ],
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '\$199.99',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star_border,
                color: Colors.yellow,
              ),
              SizedBox(width: 8),
              Text(
                '4.5 (120 reviews)',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
            'nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Implement add to cart logic
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          primary: Colors.blue,
        ),
        child: Text(
          'Add to Cart',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}