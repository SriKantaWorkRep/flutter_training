import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "CheeseBerger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      image: "assets/images/images.jpg",
      price: 1.99,
      foodCategory: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "CheeseBerger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      image: "assets/images/building.png",
      price: 1.99,
      foodCategory: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "HamBerger",
      description:
          "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      image: "assets/images/building.png",
      price: 1.99,
      foodCategory: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),

    // Salads
    Food(
      name: "Garden Salad",
      description:
          "Fresh lettuce, tomatoes, cucumbers, and carrots with your choice of dressing",
      image: "assets/images/images.jpg",
      price: 4.99,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),
    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries sprinkled with salt",
      image: "assets/images/images.jpg",
      price: 2.49,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Chili", price: 1.49),
        Addon(name: "Bacon Bits", price: 1.29),
      ],
    ),
    // Desserts
    Food(
      name: "Chocolate Brownie",
      description:
          "Warm chocolate brownie served with a scoop of vanilla ice cream",
      image: "assets/images/images.jpg",
      price: 3.99,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Caramel Sauce", price: 0.99),
        Addon(name: "Nuts", price: 0.79),
        Addon(name: "Whipped Cream", price: 0.49),
      ],
    ),
    // Drinks
    Food(
      name: "Coca-Cola",
      description: "Classic Coca-Cola served chilled",
      image: "assets/images/images.jpg",
      price: 1.49,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Ice", price: 0.00),
        Addon(name: "Lemon Slice", price: 0.29),
        Addon(name: "Mint Leaves", price: 0.49),
      ],
    ),
    // Example: Salads
    Food(
      name: "Caesar Salad",
      description:
          "Romaine lettuce, croutons, parmesan cheese, and Caesar dressing",
      image: "assets/images/images.jpg",
      price: 5.49,
      foodCategory: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),
    // Example: Sides
    Food(
      name: "Onion Rings",
      description: "Crispy battered onion rings served with dipping sauce",
      image: "assets/images/building.png",
      price: 3.29,
      foodCategory: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese dip", price: 0.99),
        Addon(name: "Ranch dressing", price: 0.49),
        Addon(name: "BBQ sauce", price: 0.59),
      ],
    ),
    // Example: Desserts
    Food(
      name: "New York Cheesecake",
      description:
          "Classic New York-style cheesecake with graham cracker crust",
      image: "assets/images/images.jpg",
      price: 4.99,
      foodCategory: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Strawberry topping", price: 0.99),
        Addon(name: "Chocolate drizzle", price: 0.79),
        Addon(name: "Whipped Cream", price: 0.49),
      ],
    ),
    // Example: Drinks
    Food(
      name: "Iced Tea",
      description: "Refreshing iced tea with lemon wedges",
      image: "assets/images/building.png",
      price: 2.29,
      foodCategory: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Sugar syrup", price: 0.49),
        Addon(name: "Mint leaves", price: 0.29),
        Addon(name: "Lime wedges", price: 0.39),
      ],
    ),
    // Continue adding more items in each category as needed
  ];
  //G e t t e r s
  List<Food> get menu => _menu;

  /*
OPERATIONS
*/
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;
// add to cart
  void addToCart(Food food, List<Addon> selectedAddon) {
    print("add to cart item function running");
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food is same
      bool isSameFood = item.food == food;
      //check if available addons are same
      bool isSameAddons = ListEquality().equals(item.selectedAddon, selectedAddon);
      print('$isSameFood $isSameAddons');
      return !(isSameFood == isSameAddons);
    });

    if (cartItem != null) {
      print("incrementing cart");
      cartItem.quantity++;
    } else {
      print("adding to cart");
      _cart.add(CartItem(food: food, selectedAddon: selectedAddon));
    }
    notifyListeners();
  }

// remove from cart
  void removeFromCart(CartItem cartItem) {
    print("remove from cart item function running");
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
        // print("removed ii");
      } else {
        _cart.removeAt(cartIndex);
        // print("removed ii");
      }
    }
    notifyListeners();
  }

// get total price of cart
  double getTotalPrice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddon) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

// get total number of items in cart
  int totalItemsInCart() {
    int total = 0;
    for (CartItem cartItem in _cart) {
      total += cartItem.quantity;
    }
    return total;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
/*
HELPERS
*/
// generate a receipt
String displayCartReceipt(){
  final reciept=StringBuffer();
  reciept.writeln("here's your receipt");
  reciept.writeln();
  String formattedDate=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  reciept.writeln(formattedDate);
  reciept.writeln();
  reciept.writeln('----------------');
  for(CartItem cartItem in cart){
    reciept.writeln('${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');
    if(cartItem.selectedAddon.isNotEmpty){
      reciept.writeln('Add-ons: ${_formatAddons(cartItem.selectedAddon)}');
    }
    // reciept.writeln();
  }
  reciept.writeln("------------");
  reciept.writeln();
  reciept.writeln("Total Items: ${totalItemsInCart()}");
  reciept.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

  return reciept.toString();
}
// format double value into money
String _formatPrice(double price){
  return '\$${price.toStringAsFixed(2)}';
}
//format list of addons into string summary
String _formatAddons(List<Addon> addons){
  return addons.map((addon) => '${addon.name} ${_formatPrice(addon.price)}').join(",  ");
}
}
