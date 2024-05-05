part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

class WishlistAddToHeartEvent extends WishlistEvent{
  final ProductDataModel productDataModel;
  WishlistAddToHeartEvent({required this.productDataModel});
}

class WishlistRemoveFromHeartEvent extends WishlistEvent{
  final ProductDataModel productDataModel;
  WishlistRemoveFromHeartEvent({required this.productDataModel});
}

