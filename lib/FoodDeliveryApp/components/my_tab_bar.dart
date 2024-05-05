import 'package:dealdox_integrated/FoodDeliveryApp/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});
  List<Tab> widgetTabBuilder() {
    return FoodCategory.values.map(
      (e) {
        // print(e.name);
        return Tab(text: e.name.toString());
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: widgetTabBuilder(),
      ),
    );
  }
}
