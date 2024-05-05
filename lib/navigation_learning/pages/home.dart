import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap:()=> Navigator.pushNamed(context, '/second'),
          child: Container(
            width: 100,
            height: 100,
            child: Text("Push to second page"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
