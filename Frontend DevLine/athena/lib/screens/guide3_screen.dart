// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guide3Screen extends StatefulWidget {
  const Guide3Screen({Key? key}) : super(key: key);

  static String id = "guide3_screen";

  @override
  _Guide3ScreenState createState() => _Guide3ScreenState();
}

class _Guide3ScreenState extends State<Guide3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedButton(),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController scaleController;
  late Animation cornerRadiusAnimation;
  late Animation widthAnimation;
  late Animation scaleAnimation;

  bool show = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    )..addListener(() {
        setState(
          () {},
        );
      });
    scaleController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1000,
        ))
      ..addListener(() {
        setState(
          () {},
        );
      });

    cornerRadiusAnimation =
        Tween(begin: 10.0, end: 30.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));

    widthAnimation = Tween(begin: 250.0, end: 40.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.slowMiddle,
    ));

    scaleAnimation = Tween(begin: 1.0, end: 1000.0).animate(CurvedAnimation(
      parent: scaleController,
      curve: Curves.slowMiddle,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scaleController.dispose();
    convert = false;
  }

  bool convert = false;
  bool hideText = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.forward();
              hideText = !hideText;
              Future.delayed(Duration(milliseconds: 400), () {
                scaleController.forward();
                convert = !convert;
                Timer(Duration(milliseconds: 500), () {
                  controller.reverse();
                });
                Timer(Duration(seconds: 2), () {
                  setState(() {
                    show = true;
                  });
                });
              });
            },
            child: Stack(
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints.expand(
                        width: (widthAnimation.value + scaleAnimation.value),
                        height: (scaleAnimation.value + 40)),
                    decoration: convert
                        ? BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.rectangle,
                          )
                        : BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(
                                cornerRadiusAnimation.value),
                            shape: BoxShape.rectangle,
                          ),
                    child: Center(
                        child: !hideText
                            ? Text(
                                "Log in",
                                maxLines: 1,
                                style: TextStyle(color: Colors.white),
                              )
                            : Text("")),
                  ),
                ),
                show
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
