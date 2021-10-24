import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_lights_with_flutter_bloc/core/constants/theme_constants.dart';
import 'package:traffic_lights_with_flutter_bloc/views/traffic/traffic_cubit.dart';
import 'package:traffic_lights_with_flutter_bloc/core/extensions/context_extensions.dart';

class TrafficView extends StatelessWidget {
  const TrafficView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrafficCubit(),
        child:
            BlocBuilder<TrafficCubit, TrafficState>(builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTrafficLights(
                context,
                state,
              ),
              buildTimerDisplayAndButton(context)
            ],
          );
        }));
  }

  Padding buildTimerDisplayAndButton(BuildContext context) {
    int leftSeconds = context.read<TrafficCubit>().leftSeconds;
    int initialSeconds = context.read<TrafficCubit>().initialSeconds;

    return Padding(
      padding: ThemeConstants.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: ThemeConstants.padding,
            child: Card(
              child: Padding(
                padding: ThemeConstants.padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Timer: ",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      leftSeconds == 0 ? "$initialSeconds" : "$leftSeconds",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: ThemeConstants.padding,
            child: ElevatedButton.icon(
                onPressed: () => context.read<TrafficCubit>().start(),
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                label: const Text("Start")),
          ),
        ],
      ),
    );
  }

  Padding buildTrafficLights(
    BuildContext context,
    TrafficState state,
  ) {
    Color lightOffColor = Colors.grey;
    return Padding(
      padding: ThemeConstants.padding,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.amber.shade200,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: ThemeConstants.padding,
            child: Column(
              children: [
                buildCircleAvatar(
                    state is RedLightState ? Colors.red : lightOffColor),
                buildCircleAvatar(state is YellowLightState
                    ? Colors.yellow.shade700
                    : lightOffColor),
                buildCircleAvatar(state is GreenLightState
                    ? Colors.green.shade700
                    : lightOffColor),
              ],
            ),
          )),
    );
  }

  Padding buildCircleAvatar(Color color) {
    return Padding(
      padding: ThemeConstants.padding,
      child: CircleAvatar(backgroundColor: color),
    );
  }
}
