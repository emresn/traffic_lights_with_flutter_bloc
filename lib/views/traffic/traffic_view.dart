import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_flutter_bloc/views/traffic/traffic_cubit.dart';
import 'package:traffic_lights_with_flutter_bloc/core/extensions/context_extensions.dart';

class TrafficView extends StatelessWidget {
  const TrafficView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightOff = Colors.grey;

    return BlocProvider(
        create: (context) => TrafficCubit(),
        child:
            BlocBuilder<TrafficCubit, TrafficState>(builder: (context, state) {
          return Center(
            child: Row(
              children: [
                buildTrafficLights(context, state, lightOff),
                Column(
                  children: [
                    Text("${context.read<TrafficCubit>().leftSeconds}"),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        onPressed: () => context.read<TrafficCubit>().start(),
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        ),
                        label: const Text("Start")),
                  ],
                )
              ],
            ),
          );
        }));
  }

  Container buildTrafficLights(
      BuildContext context, TrafficState state, Color lightOff) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.orange.shade700,
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCircleAvatar(state is RedLightState ? Colors.red : lightOff),
              buildCircleAvatar(
                  state is YellowLightState ? Colors.yellow : lightOff),
              buildCircleAvatar(
                  state is GreenLightState ? Colors.green : lightOff),
            ],
          ),
        ));
  }

  Padding buildCircleAvatar(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(backgroundColor: color),
    );
  }
}
