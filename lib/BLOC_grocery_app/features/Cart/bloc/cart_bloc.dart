import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../data/cart_items.dart';
import '../../home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    on<CartAddToCartEvent>(cartAddToCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    // cartItems.add(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartAddToCartEvent(
      CartAddToCartEvent event, Emitter<CartState> emit) {
    // cartItems.add(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
