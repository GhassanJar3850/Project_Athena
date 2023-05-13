// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  static String id = "course_screen";

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        print(scrollController.offset);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 30,
            expandedHeight: 300,
            pinned: true,
            primary: true,
            floating: true,
            elevation: 3,
            backgroundColor: Colors.red.shade900,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.5,
                  strokeAlign: StrokeAlign.outside,
                  color: Colors.red.shade900),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(kCornerRoundness),
                bottomLeft: Radius.circular(kCornerRoundness),
              ),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(kCornerRoundness),
                bottomLeft: Radius.circular(kCornerRoundness),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/course_cover.jpg",
                    height: 362,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(150, 40, 40, 40)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 220, //- scrollController.offset * 0.94,
                      left: 20, // + scrollController.offset / 2.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Guide the reach B1\nEnglish Proficiency",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.red.shade900),
                                    shape: BoxShape.circle),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    "assets/images/profilepic.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mokhless Darwish",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size(50, 20),
                                        backgroundColor: Colors.red.shade900,
                                        padding: EdgeInsets.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Follow",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            height: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Center(
                      child: Text(
                        "",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                childCount: 40),
          )
        ],
      ),
    );
  }
}
