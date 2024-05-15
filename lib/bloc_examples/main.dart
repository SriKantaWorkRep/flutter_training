import 'package:dealdox_integrated/bloc_examples/image_picker/bloc/image_picker_bloc.dart';
import 'package:dealdox_integrated/bloc_examples/image_picker/utils/image_picker_utils.dart';
import 'package:dealdox_integrated/bloc_examples/switch_example/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/bloc/counter_bloc.dart';
import 'favorite_app/favorite_app/favorite_app_bloc.dart';
import 'favorite_app/repository/favorite_repository.dart';
import 'image_picker/ui/image_picker_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>FavoriteBloc(FavoriteRepository())),
        BlocProvider(create: (_)=>CounterBloc()),
        BlocProvider(create: (_)=>SwitchBloc()),
        BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(colorSchemeSeed: Colors.blue),
        home: const ImagePickerScreen(),
      ),
    );
  }
}

