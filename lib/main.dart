import 'package:dealdox_integrated/dio_jwt_auth_shared_prefs/login.dart';
import 'package:flutter/material.dart' ;
import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

const name=[
  'foo',
  'bar',
  'baz',
];

extension RandomElement<T> on Iterable<T>{
  T getRandomElement()=> elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?>{
  NamesCubit():super(null);
  void getRandomNames()=>emit(name.getRandomElement());
}

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginDioJwt()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit=NamesCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Cubit"),
      ),
      body: StreamBuilder<String?>(
          stream: cubit.stream,
        builder: (context,snapshot){
            final button=TextButton(onPressed: (){
              cubit.getRandomNames();
            }, child: const Text("Pick a Random name"));
            switch(snapshot.connectionState){
              case ConnectionState.none:
                print("none");
                return button;
              case ConnectionState.waiting:
                print("awaiting");
                return button;
              case ConnectionState.active:
                print("display");
                return Column(
                  children: [
                    Text(snapshot.data??'No data'),
                    button
                  ],
                );
              case ConnectionState.done:
                return const SizedBox();
            }
        },
      ),
    );
  }
}

