import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch_bloc.dart';
import '../bloc/switch_event.dart';
import '../bloc/switch_state.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context, state) {
                    print("switch building");
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (val) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.slider),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Slider(
                        value: state.slider,
                        onChanged: (val) {
                          context.read<SwitchBloc>().add(SliderEvent(val: val));
                        }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
