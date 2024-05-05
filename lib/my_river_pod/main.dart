import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final numbers=ref.watch(numbersProvider);
    List<Widget> displayNums=numbers.map((e) => InkWell(
      onTap: ()=>ref.read(numbersProvider.notifier).remove(e),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(e.toString()),
      ),
    )).toList();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: InkWell(
        onLongPress: (){
          ref.read(numbersProvider.notifier).reset();
        },
        child: FloatingActionButton(
          onPressed: (){
            ref.read(numbersProvider.notifier).randomNums(Random().nextInt(100).toString());
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Riverpod"),
      ),
      body: Center(
        child: ListView(
          children: displayNums
        ),
      ),
    );
  }

}

final numbersProvider = StateNotifierProvider<NumberNotifier,List<String>>((ref) => NumberNotifier());

class NumberNotifier extends StateNotifier<List<String>>{
  NumberNotifier():super([]);
  void randomNums(String number){
    state =[...state,'number $number'];
  }
  void reset(){
    state=[];
  }
  void remove(String number){
    state=[...state.where((element) => element!=number)];
  }
}