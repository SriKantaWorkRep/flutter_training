import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Function()? onTap;
  final Food food;
  const FoodTile({Key? key, required this.food,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7,),
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text('\$${food.price.toString()}',style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),),
                      SizedBox(height: 5,),
                      Text(food.description,style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      ),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/images.jpg",height: 100,)),

              ],
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.tertiary,indent: 25,endIndent: 25,)
      ],
    );
  }
}
