import 'package:flutter/material.dart';
import 'package:traffic_lights_with_flutter_bloc/core/extensions/context_extensions.dart';
import 'package:traffic_lights_with_flutter_bloc/views/traffic/traffic_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TrafficView(),
        ],
      ),
    );
  }
}
