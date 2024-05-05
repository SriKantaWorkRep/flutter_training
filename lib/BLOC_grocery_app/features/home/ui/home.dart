import 'package:dealdox_integrated/BLOC_grocery_app/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Cart/ui/cart.dart';
import '../../wishlist/ui/wishlist.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Homebloc homeBloc = Homebloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Homebloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          }else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          }else if(state is HomeProductItemWishlistedActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item WishListed")));
          }else if(state is HomeProductItemCartedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item added to cart")));
          }

        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Colors.pink,
                  ),
                ),
              );
              break;
            case HomeLoadedSucessSuccessState:
              final sucessState = state as HomeLoadedSucessSuccessState;
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(
                    "Srikanta's grocery app",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )),
                  ],
                ),
                body: ListView.builder(
                    itemCount: sucessState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          productDataModel: sucessState.products[index],homeBloc: homeBloc,);
                    }),
              );
              break;
            case HomeErrorState:
              return Scaffold(
                body: Center(
                  child: Text("Error Loading"),
                ),
              );
              break;
            default:
              return SizedBox();
          }
        });
  }
}
