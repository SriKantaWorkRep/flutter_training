import 'package:dealdox_integrated/FoodDeliveryApp/components/my_current_location.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/components/my_description_box.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/components/my_drawer.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/components/my_silver_app_bar.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/components/my_tab_bar.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/food.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_foodtile.dart';
import 'food_page.dart';

class FHomePage extends StatefulWidget {
  const FHomePage({super.key});

  @override
  State<FHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<FHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    print(FoodCategory.values.length);
    tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

//return list of food items by specific category
  List<Food> _filterMenuByCategory(
      FoodCategory category, List<Food> menuItems) {

    return menuItems
        .where((food) => food.foodCategory == category)
        .toList();
  }

  //return list- of foods in given category -- it will return List of type ListView of type listtile
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    List<Widget> tt = FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      // print(categoryMenu[2].name);
      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => FoodTile(
          food: categoryMenu[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodPage(food: categoryMenu[index]),
            ),
          ),
        ),
      );
    }).toList();
    // print(tt);
    return tt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(
              tabController: tabController,
            ),
            // title: Text(""),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //current location
                MyCurrentLocation(),
                //description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Consumer<Restaurant>(builder: (context, restaurant, child) {
            // print(restaurant);//we will get instance
            //print(child);
            return TabBarView(
              controller: tabController,
              children: getFoodInThisCategory(restaurant.menu),
            );
          }),
        ),
      ),
    );
  }
}
