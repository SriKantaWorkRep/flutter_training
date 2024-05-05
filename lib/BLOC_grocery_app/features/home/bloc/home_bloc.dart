import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dealdox_integrated/data/cart_items.dart';
import 'package:dealdox_integrated/data/grocery_data.dart';
import 'package:dealdox_integrated/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class Homebloc extends Bloc<HomeEvent, HomeState> {
  Homebloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }
// first method called when app will open
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSucessSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  name: e["name"],
                  id: e["id"],
                  description: e["description"],
                  imageUrl: e["imageUrl"],
                  price: e["price"]),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
    print("wishlist navigate Clicked");
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
    print("cart navigate Clicked");
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    bool contains = false;
    int i = 0;
    for (i = 0; i < wishListItems.length; i++) {
      if (wishListItems[i].id == event.clickedProduct.id) {
        contains = true;
        break;
      }
    }
    if (contains == false)
      wishListItems.add(event.clickedProduct);
    else
      wishListItems.removeAt(i);
    print(contains);
    print("wishlist Product Clicked");
    // wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    bool contains = false;
    int i = 0;
    for (i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == event.clickedProduct.id) {
        contains = true;
        break;
      }
    }
    print(contains);
    if (contains == false)
      cartItems.add(event.clickedProduct);
    else
      cartItems.removeAt(i);
    print("Cart Product Clicked");
    emit(HomeProductItemCartedActionState());
  }
}
