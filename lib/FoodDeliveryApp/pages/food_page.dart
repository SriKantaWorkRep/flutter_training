import 'package:dealdox_integrated/FoodDeliveryApp/components/my_button.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> availableAddon={};
   FoodPage({super.key, required this.food}){
    for(Addon addon in food.availableAddons){
      availableAddon[addon]=true;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background
            ),
            // color: Colors.pink,
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //image
                  Image.asset(
                    widget.food.image,
                    width: 300,
                    height: 300,
                  ),
                  //food name
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ), // TextStyle),
                        //food description
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        Text("Add - ons"),
                        //addon
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.food.availableAddons.length,
                              itemBuilder: (context, index) {
                                Addon addon=widget.food.availableAddons[index];
                                return CheckboxListTile(
                                    title:
                                    Text(addon.name),
                                    subtitle: Text(
                                        '${addon.price.toString()} \$'),
                                    value: widget.availableAddon[addon],
                                    onChanged: (value) {
                                      // print(widget.availableAddon[widget.food.availableAddons[index]]);
                                      setState(() {
                                        widget.availableAddon[addon]=!widget.availableAddon[addon]!;
                                      });
                                    });
                              }),
                        ),
                        SizedBox(height: 14,),//add to cart
                        MyButton(onTap: (){
                          Navigator.pop(context);
                          addToCart(widget.food,widget.availableAddon);
                          }, text: "Add to Cart")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: .5,
            child: Container(
              margin: EdgeInsets.only(left: 10,top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
        )
      ],
    );
  }

  addToCart(Food food, Map<Addon, bool> availableAddon) {
    //format the sele
    List<Addon> myAddons=[];
    for(Addon addon in widget.food.availableAddons){
      if(availableAddon[addon]==true){
        myAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, myAddons);
  }
}
