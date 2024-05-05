import 'food.dart';

class CartItem{
  final Food food;
  final List<Addon> selectedAddon;
  int quantity;
  CartItem({required this.food, required this.selectedAddon,this.quantity=1});
  double get totalPrice{
    double total=selectedAddon.fold(0, (sum,addon) => sum+=addon.price);
    return (food.price+total)*quantity;
  }

}