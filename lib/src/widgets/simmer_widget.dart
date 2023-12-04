import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';


//this Simmer loader class

class SimmerLoader{

static  simmerLoaderWidget()=>AnimationLimiter(
  child: ListView.builder(
    itemCount: 8,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      
      return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.white,
        child: AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 300),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
                child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name $index',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
    ) ,
          ),
        ),
      )    );},
  ),
);

}
