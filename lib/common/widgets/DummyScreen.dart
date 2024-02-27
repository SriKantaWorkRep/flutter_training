import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: Dummy(),
    ),
  ));
}
class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red
          ),
          child: Center(child: Text("Hi Welcome",style: TextStyle(fontSize: 30),)),
        ),
      ),
    );
  }
}
