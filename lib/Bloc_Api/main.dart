import 'package:dealdox_integrated/Bloc_Api/favorite_app/favorite_app/favorite_app_bloc.dart';
import 'package:dealdox_integrated/Bloc_Api/favorite_app/favorite_app/screen/favorite_app_screen.dart';
import 'package:dealdox_integrated/Bloc_Api/favorite_app/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dealdox_integrated/firebase_options.dart';

import 'counter/ui/counter_screen.dart';

void main(){
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>FavoriteBloc(FavoriteRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(colorSchemeSeed: Colors.blue),
        home: const CounterScreen(),
      ),
    );
  }
}


