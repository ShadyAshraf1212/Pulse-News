import 'package:flutter/material.dart';
import 'package:pulse_news/core/utils/colors_manager.dart';
import 'package:pulse_news/core/utils/styles_manager.dart';

class ThemeManager {
  //todo: Light theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.white,
    dividerColor: ColorsManager.black,
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      
    ),
    textTheme: TextTheme(
      headlineMedium: StylesManager.medium20black,
      titleLarge: StylesManager.medium24black,
      bodyMedium: StylesManager.bold16black,
      titleMedium: StylesManager.medium14black,
    ),
  );
  //todo: Dark theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManager.black,
    dividerColor: ColorsManager.white,
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineMedium: StylesManager.medium20white,
      titleLarge: StylesManager.medium24white,
      bodyMedium: StylesManager.bold16white,
      titleMedium: StylesManager.medium14white,
    ),
  );
}
