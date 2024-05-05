import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';
import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final Homebloc homeBloc;
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel,required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  productDataModel.imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text('Name: ${productDataModel.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
          Text('Description ${productDataModel.description}',),
          SizedBox(height: 17,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price: ${productDataModel.price.toString()}\$',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
