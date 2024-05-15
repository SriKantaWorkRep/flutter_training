import 'package:equatable/equatable.dart';
import '../model/favorite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavoriteItemState extends Equatable {
  final List<FavoriteItemModel> favoriteItemList;
  final List<FavoriteItemModel> tempFavoriteItemList;
  final ListStatus listStatus;
  const FavoriteItemState(
      {this.favoriteItemList = const [],
      this.tempFavoriteItemList = const [],
      this.listStatus = ListStatus.loading});
  @override
  List<Object?> get props => [favoriteItemList, listStatus,tempFavoriteItemList];

  FavoriteItemState copyWith({
    List<FavoriteItemModel>? favoriteItemList,
    ListStatus? listStatus,
    List<FavoriteItemModel>? tempFavoriteItemList,
  }) {
    return FavoriteItemState(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus,
      tempFavoriteItemList: tempFavoriteItemList ?? this.tempFavoriteItemList,
    );
  }
}
