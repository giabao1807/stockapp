import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/styles/theme/colors.dart';

final lightThemeData = ThemeData(
  // Define your light theme data here
  // brightness: Brightness.light,
  scaffoldBackgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: styles['PRIMARY__BG__COLOR']!.toColor())),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
    bodyMedium: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
    bodySmall: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
  ),

  // Add other theme properties as needed
);

final darkThemeData = ThemeData(
    // Define your dark theme data here
    // brightness: Brightness.dark,
    scaffoldBackgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
      appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: styles['PRIMARY__BG__COLOR']!.toColor())),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
      bodyMedium:
          TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
      bodySmall: TextStyle(color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
    )
    // Add other theme properties as needed
    );
