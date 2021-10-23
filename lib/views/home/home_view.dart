import 'package:flutter/material.dart';
import 'package:traffic_lights_with_flutter_bloc/core/extensions/context_extensions.dart';
import 'package:traffic_lights_with_flutter_bloc/views/traffic/traffic_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.8),
      height: context.dynamicHeight(0.5),
      child: Column(
        children: const [
          TrafficView(),
        ],
      ),
    );
  }
}
