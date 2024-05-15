import 'package:dealdox_integrated/bloc_examples/learning/test_equatable.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.teal
      ),
      home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person person3 =Person(name: "srikanta", age: 18);
          Person person1=Person(name: "srikanta", age: 18);
          print(person1==person3);
        },
      ),
      ),
    );
  }
}