import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TrafficCubit extends Cubit<TrafficState> {
  bool redLight = false;
  bool yellowLight = false;
  bool greenLight = false;
  int initialSeconds = 5;
  int leftSeconds = 0;

  TrafficCubit() : super(InitialState());

  void reset() => emit(InitialState());

  void start() {
    leftSeconds = initialSeconds;

    startTimer();
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (leftSeconds >= 0) {
        leftSeconds--;

        if (leftSeconds > 2) {
          emit(RedLightState());
        }

        if (leftSeconds <= 2) {
          turnOffAllLights();
          emit(YellowLightState());
        }
        if (leftSeconds == 0) {
          emit(GreenLightState());
          timer.cancel();
        }
      } else {
        timer.cancel();
      }
    });
  }

  void turnOnLight(String colorname) {
    turnOffAllLights();
    if (colorname == "red") {
      redLight = true;
      emit(RedLightState());
    } else if (colorname == "yellow") {
      yellowLight = true;
      emit(YellowLightState());
    } else if (colorname == "green") {
      greenLight = true;
      emit(GreenLightState());
    }
  }

  void turnOffAllLights() {
    redLight = false;
    yellowLight = false;
    greenLight = false;
  }
}

abstract class TrafficState {}

class InitialState extends TrafficState {}

class GreenLightState extends TrafficState {}

class YellowLightState extends TrafficState {}

class RedLightState extends TrafficState {}
