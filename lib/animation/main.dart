import 'package:dealdox_integrated/animation/explicit_animation/radial_progress_animation.dart';
import 'package:dealdox_integrated/animation/implicit_examples/PulsatingAnimation.dart';
import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:RadialProgressAnimation(progress: .6));
  }
}
