import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/pages/my_receipt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Progress.."),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          MyReciept(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          //profile pic of driver
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          //driver details
          Container(
              decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.background,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Srikanta",
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Fast and cool Driver",
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
          Spacer(),
          //message button
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  // color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  icon: Icon(Icons.message_sharp),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.add_ic_call_outlined),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          //call button
        ],
      ),
    );
  }
}
