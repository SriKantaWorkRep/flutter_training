
import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyStreams();
  }
}

class MyStreams extends StatelessWidget {
  const MyStreams({super.key});

  Stream generateDate()async*{
    while(true){
      Future.delayed(const Duration(seconds: 1),() {},);
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              StreamBuilder(
                stream: generateDate(),
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

