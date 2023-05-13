// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/transitions.dart';
import 'guide2_screen.dart';

class Guide1Screen extends StatefulWidget {
  const Guide1Screen({Key? key}) : super(key: key);
  static String id = "guide1_screen";

  @override
  _Guide1ScreenState createState() => _Guide1ScreenState();
}

class _Guide1ScreenState extends State<Guide1Screen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              "Guide 1",
              style: TextStyle(fontSize: 55),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width * 0.5 - 25,
            top: mediaQuery.size.height * 0.88,
            child: Hero(
              tag: "next",
              child: IconButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    CircleBorder(
                      side: BorderSide(width: 2,color: Colors.redAccent),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(FadeTransitionTo(Guide2Screen()));
                },
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  size: 35,
                ),
              ),
            ),
          ),
          Positioned(
            left: mediaQuery.size.width/2 - 75,
            top: 50,
            child: Hero(
              tag: "logo",
              child: Image.asset(
                "assets/images/athena_logo3.png",
                height: 150,
                width: 150,
                color: Colors.redAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
