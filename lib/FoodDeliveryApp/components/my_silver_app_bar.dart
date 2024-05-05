import 'package:dealdox_integrated/FoodDeliveryApp/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 360,
      elevation: 120,
      floating: true,
      pinned: true,
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
        }, icon:const Icon( Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:const Text("Sunset Dinner"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title:title,
        background: child,
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        titlePadding:const EdgeInsets.only(left: 0,right: 0,top: 100),
        stretchModes: [StretchMode.blurBackground,StretchMode.blurBackground,StretchMode.blurBackground,StretchMode.blurBackground],
        expandedTitleScale: 1,
      ),
    );
  }
}
