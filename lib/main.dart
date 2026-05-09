import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_news/core/utils/theme_manager.dart';
import 'package:pulse_news/ui/home/home_screen.dart';

import 'core/utils/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: RoutesManager.home,
          routes: {RoutesManager.home: (context) => HomeScreen()},

          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
        );
      },
    );
  }
}
