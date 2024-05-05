import 'package:dealdox_integrated/FoodDeliveryApp/components/my_button.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/components/my_cart_tile.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/pages/payment_page.dart';
import 'package:dealdox_integrated/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder:(context,restaurant,child){
      final userCart=restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                      title: Text("Are you sure you want to delete items"),
                      actions: [
                        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("cancel")),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                          restaurant.clearCart();}, child: Text("Delete",style: TextStyle(color: Colors.red),))
                      ],
                    ));
                  },
                  child: Icon(Icons.delete_outline)),
            ),
          ],
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  userCart.isEmpty?Expanded(child: Center(child: Text("Your Cart Empty...")))
                      :Expanded(child: ListView.builder(
                    itemCount:userCart.length,
                      itemBuilder: (context,index){
                      print("length "+userCart.length.toString());
                        return MyCartTile(cartItem: userCart[index]);
                      },
                  ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: MyButton(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage())), text: "Place Order")),
           const SizedBox(height: 10,)
          ],
        ),
      );
    });
  }
}
