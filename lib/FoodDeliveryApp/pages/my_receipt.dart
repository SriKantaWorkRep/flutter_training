import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( left: 25,right: 25,bottom: 25 ),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Thank you for your order!",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
              ),
              padding: EdgeInsets.all(25),
              child: Consumer<Restaurant>(builder:(context,restaurant,child)=>Text(restaurant.displayCartReceipt())),
            ),
            SizedBox(height: 10,),
            const Text("Thank you for your order!"),

          ],
        ),
      ),
    );
  }
}
