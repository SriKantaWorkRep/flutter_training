import 'dart:core';
import '../model/favorite_item_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 2));
    return List<FavoriteItemModel>.of(_generateList(3)!);
  }

  List<FavoriteItemModel>? _generateList(int length) {
    return List.generate(
        length, (index) => FavoriteItemModel(id: '$index', value: '$index rs'));
  }
}
