import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistAddToHeartEvent>(wishlistAddToHeartEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }

  FutureOr<void> wishlistAddToHeartEvent(WishlistAddToHeartEvent event, Emitter<WishlistState> emit) {
    // wishListItems.add(event.productDataModel);
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }
}