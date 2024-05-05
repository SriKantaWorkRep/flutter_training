import 'package:dealdox_integrated/navigation_learning/pages/home.dart';
import 'package:dealdox_integrated/navigation_learning/pages/second_page.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
      routes: {
          '/':(context)=>Home(),
          '/second':(context)=>SecondPage(),
      },
    );
  }
}
