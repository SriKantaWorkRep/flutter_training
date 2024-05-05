import 'package:dealdox_integrated/provider/model/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSub extends StatelessWidget {
  const AddSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Calculation>(builder: (context, value, child) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<Calculation>().increment();
                    },
                    icon: Icon(Icons.add),
                ),
                Text(context.read<Calculation>().counter.toString()),
                IconButton(
                    onPressed: () {
                      context.read<Calculation>().decrement();
                    },
                    icon: Icon(Icons.minimize)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
