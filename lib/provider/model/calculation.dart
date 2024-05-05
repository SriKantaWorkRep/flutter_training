import 'package:flutter/cupertino.dart';

class Calculation with ChangeNotifier{
   int counter=0;
  void increment(){
    counter++;
    notifyListeners();
  }
  void decrement(){
    counter--;
    notifyListeners();
  }
}