import 'package:flutter/material.dart';

class RadialProgressAnimation extends StatefulWidget {
  final double progress;
  const RadialProgressAnimation({super.key, required this.progress});

  @override
  State<RadialProgressAnimation> createState() =>
      _RadialProgressAnimationState();
}

class _RadialProgressAnimationState extends State<RadialProgressAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  // late double currentVal;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: widget.progress).animate(animationController);
    super.initState();
  }
  // void animationControl() {
  //   if (animation.isCompleted) {
  //     animationController.reverse();
  //   } else {
  //     animationController.forward();
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // animationControl();
        },
        child: const Icon(Icons.file_upload_outlined),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                      value: animation.value,
                      strokeWidth: 10,
                      semanticsValue: "Hi",
                    ),
                  ),
                  Text('${(animation.value * 100).toInt()}%')
                ],
              );
            }),
      ),
    );
  }
}
