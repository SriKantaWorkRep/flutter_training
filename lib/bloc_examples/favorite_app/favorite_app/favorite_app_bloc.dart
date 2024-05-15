import 'package:bloc/bloc.dart';
import '../model/favorite_item_model.dart';
import '../repository/favorite_repository.dart';
import 'favorite_app_event.dart';
import 'favorite_app_state.dart';

class FavoriteBloc extends Bloc<FavoriteItemEvent, FavoriteItemState> {
  FavoriteRepository favoriteRepository;
  List<FavoriteItemModel> favoriteList = [];
  List<FavoriteItemModel> tempFavoriteList = [];
  FavoriteBloc(this.favoriteRepository) : super(const FavoriteItemState()) {
    on<FavoriteItems>(_addFavoriteItem);
    on<FetchFavoriteList>(_fetchFavoriteList);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteEvent>(_deleteItems);
  }

  void _fetchFavoriteList(
      FetchFavoriteList event, Emitter<FavoriteItemState> emit) async {
    favoriteList = await favoriteRepository.fetchItem();
    emit(state.copyWith(
        favoriteItemList: List.from(favoriteList),
        listStatus: ListStatus.success));
  }

  void _addFavoriteItem(FavoriteItems event, Emitter<FavoriteItemState> emit) {
    final index =
        favoriteList.indexWhere((element) => element.id == event.item.id);
    favoriteList[index] = event.item;

    final tempIndex=tempFavoriteList.indexWhere((element) => element.id==event.item.id);
    if(tempIndex!=-1)tempFavoriteList[tempIndex]=event.item;
    emit(state.copyWith(favoriteItemList: List.from(favoriteList),tempFavoriteItemList: List.from(tempFavoriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavoriteItemState> emit) async {
    tempFavoriteList.add(event.item);
    emit(state.copyWith(tempFavoriteItemList: List.from(tempFavoriteList)));
  }

  void _unSelectItem(
      UnSelectItem event, Emitter<FavoriteItemState> emit) async {
    tempFavoriteList.remove(event.item);
    emit(state.copyWith(tempFavoriteItemList: List.from(tempFavoriteList)));
  }

  void _deleteItems(DeleteEvent event, Emitter<FavoriteItemState> emit) {
    for (int i = 0; i < tempFavoriteList.length; i++) {
      favoriteList.remove(tempFavoriteList[i]);
    }
    tempFavoriteList.clear();
    emit(state.copyWith(
        tempFavoriteItemList: List.from(tempFavoriteList),
        favoriteItemList: List.from(favoriteList)));
  }
}
