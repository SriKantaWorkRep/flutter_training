import 'package:flutter/material.dart';

class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final FoodCategory foodCategory;
  final List<Addon> availableAddons;

  Food(
      {
        required this.foodCategory,
        required this.availableAddons,
        required this.name,
      required this.description,
      required this.image,
      required this.price});
}

// food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
