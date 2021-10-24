import 'package:flutter/material.dart';
import 'package:traffic_lights_with_flutter_bloc/core/constants/theme_constants.dart';

final theme1 = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade700),
  cardTheme: CardTheme(
      color: Colors.blueGrey.shade200,
      margin: const EdgeInsets.all(14),
      shadowColor: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          elevation: 5,
          padding: ThemeConstants.padding_small)),
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
      bodyText1: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      subtitle1: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
      button: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700)),
);
