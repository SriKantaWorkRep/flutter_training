import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.number.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementEvent());
                        }, child: const Text("Increment")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementEvent());
                        }, child: const Text("Decrement"))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
