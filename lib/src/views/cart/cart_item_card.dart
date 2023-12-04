import 'package:flutter/material.dart';


class CartItemCard extends StatelessWidget {
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final int quantity;

  const CartItemCard({
    required this.imgUrl,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           _buildProductImage(),
           SizedBox(width:15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: \u{20B9}${itemPrice.toString()}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        // Implement remove item logic
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Implement add item logic
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

    Widget _buildProductImage() {
    return Container(
       height: 150,
       width:150,
      decoration:  BoxDecoration(
        borderRadius:BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
           imgUrl,
          ),
          fit: BoxFit.cover,

        ),
      ),
    );
  }

}