import 'package:flutter/material.dart';
import 'package:traffic_lights_with_flutter_bloc/views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Traffic Lights'),
          ),
          body: const HomeView()),
    );
  }
}
