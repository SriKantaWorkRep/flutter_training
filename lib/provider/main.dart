import 'package:dealdox_integrated/provider/model/calculation.dart';
import 'package:dealdox_integrated/provider/pages/AddSub.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: AddSub(),
        create: (context)=>Calculation());
  }
}

