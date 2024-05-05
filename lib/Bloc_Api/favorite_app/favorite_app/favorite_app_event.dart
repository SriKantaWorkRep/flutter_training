import 'package:dealdox_integrated/Bloc_Api/favorite_app/model/favorite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteItemEvent extends Equatable {
  const FavoriteItemEvent();
  @override
  List<Object> get props=>[];
}

class FetchFavoriteList extends FavoriteItemEvent {}

class FavoriteItems extends FavoriteItemEvent{
  final FavoriteItemModel item;
  const FavoriteItems({required this.item});
}
class SelectItem extends FavoriteItemEvent{
  final FavoriteItemModel item;
  const SelectItem({required this.item});
}
class UnSelectItem extends FavoriteItemEvent{
  final FavoriteItemModel item;
  const UnSelectItem({required this.item});
}

class DeleteEvent extends FavoriteItemEvent{
}