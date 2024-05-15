import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/favorite_item_model.dart';
import '../favorite_app_bloc.dart';
import '../favorite_app_event.dart';
import '../favorite_app_state.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavoriteList());
  }
  @override
  Widget build(BuildContext context) {
    print("whole Rebuild");
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoriteBloc,FavoriteItemState>(
            builder:(context,state)=> Visibility(
              visible: state.tempFavoriteItemList.isEmpty?false:true,
              child: IconButton(onPressed: (){
                context.read<FavoriteBloc>().add(DeleteEvent());
              }, icon:const Icon(Icons.delete,color: Colors.red,)),
            ),
          ),
        ],
        title:const Text("Todo App"),
      ),
      body: BlocBuilder<FavoriteBloc,FavoriteItemState>(
        builder: (context,state){
          print("list build");
          switch(state.listStatus){
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(
                child: Text("Something Went Wrong",style: TextStyle(color: Colors.red),),);
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favoriteItemList.length,
                itemBuilder: (context,index){
                  final item=state.favoriteItemList[index];
                  return Card(
                    child:ListTile(
                      leading: Checkbox(
                        onChanged: (value){
                          // print( state.tempFavoriteItemList.contains(item));
                          // FavoriteItemModel model=FavoriteItemModel(id: item.id, value: item.value,isDeleting: item.isDeleting?false:true);
                          if(value!) {
                            // print('selecting');
                            context.read<FavoriteBloc>().add(SelectItem(item: item));
                          }else{
                            // print('deselecting');
                            context.read<FavoriteBloc>().add(UnSelectItem(item: item));
                          }
                          },
                        value: state.tempFavoriteItemList.contains(item)?true:false,
                      ),
                        title:  Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: (){
                              FavoriteItemModel model=FavoriteItemModel(id: item.id, value: item.value,isFavorite: item.isFavorite?false:true);
                            context.read<FavoriteBloc>().add(FavoriteItems(item: model));
                            },
                            icon:  Icon(
                                item.isFavorite?Icons.favorite:Icons.favorite_border)),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
