import 'package:dealdox_integrated/FoodDeliveryApp/auth/login_or_registration.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/models/restaurant.dart';
import 'package:dealdox_integrated/FoodDeliveryApp/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
          child: MyApp(),
          providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ])
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegistration(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
