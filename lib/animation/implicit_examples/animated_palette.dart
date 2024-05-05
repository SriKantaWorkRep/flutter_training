import 'dart:math';
import 'package:flutter/material.dart';

/// Random color generator
class AnimatedColorPalette extends StatefulWidget {
  AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> currentPallete = generateRandomPalette();

  @override
  void initState() {
    super.initState();
  }

  void assignColors() {
    setState(() {
      currentPallete = generateRandomPalette();
    });
  }

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (index) => Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(Color color in currentPallete)
                AnimatedContainer(
                  // curve: Curve().,
                  duration:const  Duration(milliseconds: 1500),
                  height: 100,
                  width: 100,
                  color: color,
                ),
              MaterialButton(
                onPressed: (){
                  assignColors();
                },
                child: Text("generate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
