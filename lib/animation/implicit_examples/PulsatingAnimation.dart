import 'dart:async';

import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() =>
      _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> with SingleTickerProviderStateMixin{
  // late AnimationController controller;
  // late Animation<double> animation;
  Tween<double> tween=Tween<double>(begin: 0,end: 100);
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      setState(() {
        if(tween.end==100){
          tween.begin=100;
        }else{

        }
      });
    });
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bubbling"),
        ),
        body: Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: 200),
                duration: const Duration(milliseconds: 1500),
                builder: (context,value,child) {
                  return Container(
                    height: value,
                    width: value,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.5),
                            blurRadius: 50,
                            spreadRadius: 100,
                          ),
                        ]),
                  );
                }
                )),
      ),
    );
  }
}
