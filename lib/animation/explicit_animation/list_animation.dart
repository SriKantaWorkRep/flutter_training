import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> slideAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    slideAnimation = List.generate(6, (index) => Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(CurvedAnimation(parent: controller, curve: Interval(index*.13, 1))),);
    super.initState();
  }

  void animationController() {
    if (!controller.isCompleted) {
      controller.forward();
    }else{
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Animation"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => SlideTransition(
            position: slideAnimation[index],
            child: ListTile(
              title: Text("Hello bro"),
              trailing: Text(index.toString()),
            )),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          animationController();
        },
        child: const Icon(
          Icons.check,
          size: 80,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
