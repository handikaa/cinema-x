// Light Theme
import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ThemeColor.blueAccent,
    onPrimary: ThemeColor.white,
    secondary: ThemeColor.green,
    onSecondary: ThemeColor.white,
    error: ThemeColor.red,
    onError: ThemeColor.white,
    surface: ThemeColor.white,
    onSurface: ThemeColor.black,
  ),
  scaffoldBackgroundColor: ThemeColor.whiteGrey,
  textTheme: const TextTheme(
    bodyLarge: const TextStyle(color: ThemeColor.black),
    bodyMedium: TextStyle(color: ThemeColor.darkGrey),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeColor.blueAccent,
    titleTextStyle: TextStyle(color: ThemeColor.white),
  ),
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: ThemeColor.blueAccent,
    onPrimary: ThemeColor.white,
    secondary: ThemeColor.orange,
    onSecondary: ThemeColor.darkBackground,
    error: ThemeColor.red,
    onError: ThemeColor.darkBackground,
    surface: ThemeColor.blueAccent,
    onSurface: ThemeColor.whiteGrey,
  ),
  scaffoldBackgroundColor: ThemeColor.darkBackground,
  textTheme: TextTheme(
    displayLarge:
        StyleText().semiBoldText28.copyWith(color: ThemeColor.blueAccent),
    headlineLarge: StyleText().semiBoldText28.copyWith(
          color: ThemeColor.white,
        ),
    headlineMedium: StyleText().semiBoldText14.copyWith(
          color: ThemeColor.whiteGrey,
        ),
    titleMedium: StyleText().semiBoldText18.copyWith(
          color: ThemeColor.white,
        ),
    bodyMedium: StyleText().mediumText16.copyWith(
          color: ThemeColor.white,
        ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeColor.soft,
    titleTextStyle: TextStyle(color: ThemeColor.whiteGrey),
  ),
);
