import 'package:dealdox_integrated/responsive/desktop_body.dart';
import 'package:dealdox_integrated/responsive/mobile_body.dart';
import 'package:dealdox_integrated/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double Hieght=MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: width<600?Colors.green:Colors.red,
        body: ResponsiveLayout(mobileBody: MyMobileBody(),desktopBody: MyDesktopBody(),)
      ),
    );
  }
}
