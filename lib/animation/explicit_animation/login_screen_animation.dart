import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});
  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> loginFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    controller= AnimationController(vsync: this,duration:const Duration(milliseconds: 2000));
    slideAnimation=Tween<Offset>(begin:const Offset(-2,-3),end: Offset.zero).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn)
    );
    loginFadeAnimation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    scaleAnimation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInCirc));
    controller.forward();

  }
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if(controller.isCompleted){
        controller.reverse();
      }
      if(controller.isDismissed){
        controller.forward();
      }
    });
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all((15.0).toDouble()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: FadeTransition(
                    opacity: loginFadeAnimation,
                    child: FlutterLogo(
                      size: 150,
                    ),
                  ),
                ),
              ),
             SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      TextField(decoration: InputDecoration(
                        labelText: 'Username'
                      ),),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'Username'
                          ),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Button"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
