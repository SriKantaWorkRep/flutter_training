import 'package:dealdox_integrated/FoodDeliveryApp/components/my_quantity_selector.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //food image
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartItem.food.image,
                      width: 100,
                      height: 100,
                    )),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name),
                    SizedBox(
                      height: 7,
                    ),
                    Text('\$' + cartItem.food.price.toString())
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                QuantitySelector(
                  quantity: cartItem.quantity,
                  food: cartItem.food,
                  onIncrement: () => restaurant.addToCart(
                      cartItem.food, cartItem.selectedAddon),
                  onDecrement: () => restaurant.removeFromCart(cartItem),
                ),
              ],
            ),
            SizedBox(
              height: cartItem.selectedAddon.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddon.map((e) {
                  return Container(
                    margin: EdgeInsets.only(left: 5),
                    child: FilterChip(
                      onSelected: (val) {},
                      label: Row(
                        children: [
                          Text(e.name),
                          SizedBox(
                            width: 4,
                          ),
                          Text(e.price.toString())
                        ],
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
