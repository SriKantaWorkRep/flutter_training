import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedShoppingCart extends StatefulWidget {
  const AnimatedShoppingCart({super.key});

  @override
  State<AnimatedShoppingCart> createState() => _AnimatedShoppingCartState();
}

class _AnimatedShoppingCartState extends State<AnimatedShoppingCart> {
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar:AppBar(
          title: Text("Animated shopping cart"),
          ),
        body: Center(
          child: GestureDetector(
            onTap: (){
              setState(() {
                isExpanded=!isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height:60,
              width: isExpanded? 75:200,
              decoration: BoxDecoration(
                color: isExpanded?Colors.blue:Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isExpanded?const Icon(Icons.shopping_cart_outlined,color: Colors.white,):
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.check,color: Colors.white,),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 2500),
                      opacity: isExpanded?0:1,
                      child:const Text("Added to Cart",style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

