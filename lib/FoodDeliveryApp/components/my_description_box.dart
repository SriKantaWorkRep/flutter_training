import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {

  const MyDescriptionBox({super.key});
  @override
  Widget build(BuildContext context) {
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    var myPrimaryTextStyle =
    TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    return Container(
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ), // BoxDecoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery time
          Column(
            children: [
              Text("15 - 30 min",style: myPrimaryTextStyle,),
              Text('Delivery time',style: mySecondaryTextStyle,),
            ],
          ),
          SizedBox(
            width: 6,
          ),
          //delivery fee
          Column(
            children: [
              Text('\$0.99'),
              Text('Delivery fee'),
            ],
          ),
        ],
      ),
    );
  }
}
// Column
// delivery time
