// ignore_for_file: prefer_const_constructors
import 'package:athena/components/theme_data.dart';
import 'package:athena/screens/guide1_screen.dart';
import 'package:athena/screens/guide2_screen.dart';
import 'package:athena/screens/guide3_screen.dart';
import 'package:athena/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athena Project',
      //
      theme: themeData,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (route) => WelcomeScreen(),
        Guide1Screen.id: (route) => Guide1Screen(),
        Guide2Screen.id: (route) => Guide2Screen(),
        Guide3Screen.id: (route) => Guide3Screen(),
      },
    );
  }
}
