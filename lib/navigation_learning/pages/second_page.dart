import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=>Navigator.pushReplacementNamed(context, '/'),
          child: Container(
            width: 100,
            height: 100,
            child: Text("Push to home"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
