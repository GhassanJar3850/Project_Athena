// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:athena/components/transitions.dart';
import 'package:athena/screens/guide1_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              "Welcome!",
              style: TextStyle(fontSize: 55),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width / 2 - 100,
            top: 50,
            child: Hero(

              tag: "logo",
              child: Image.asset(
                "assets/images/athena_logo2.png",
                height: 200,
                width: 200,
                color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.5 - 75,
            top: mediaQuery.size.height * 0.88,
            child: Hero(
              tag: "next",
              child: TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(150, 40)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(slideTransitionTo(Guide1Screen()));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
