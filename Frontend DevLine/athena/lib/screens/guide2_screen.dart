// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/transitions.dart';
import 'guide3_screen.dart';

class Guide2Screen extends StatefulWidget {
  const Guide2Screen({Key? key}) : super(key: key);
  static String id = "guide2_screen";

  @override
  _Guide2ScreenState createState() => _Guide2ScreenState();
}

class _Guide2ScreenState extends State<Guide2Screen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              "Guide 2",
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
                  Navigator.of(context).push(slideTransitionTo(Guide3Screen()));
                },
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
