// ignore_for_file: prefer_const_constructors
import 'package:athena/components/theme_data.dart';
import 'package:athena/screens/course_screen.dart';
import 'package:athena/screens/guide1_screen.dart';
import 'package:athena/screens/guide2_screen.dart';
import 'package:athena/screens/guide3_screen.dart';
import 'package:athena/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Athena Project',
          theme: themeData,
          initialRoute: CourseScreen.id,
          routes: {
            WelcomeScreen.id: (route) => WelcomeScreen(),
            Guide1Screen.id: (route) => Guide1Screen(),
            Guide2Screen.id: (route) => Guide2Screen(),
            Guide3Screen.id: (route) => Guide3Screen(),
            CourseScreen.id: (route) => CourseScreen()
          },
        );
      },
    );
  }
}
