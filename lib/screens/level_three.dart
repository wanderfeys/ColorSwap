import 'dart:math';
import 'package:ColorSwap/components/reusableAppBar.dart';
import 'package:flutter/material.dart';

class LevelThree extends StatefulWidget {
  @override
  _LevelThreeState createState() => _LevelThreeState();
}

class _LevelThreeState extends State<LevelThree> {
  double _width = 100;
  double _height = 100;
  final Color backgroundColor = Color(0xFFfc8d8d);
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(30);

  ///animation of a changing container with a picture
  animationTap() {
    final random = Random();
    //Generate a random width and heigh
    _width = random.nextInt(400).toDouble();
    _height = random.nextInt(400).toDouble();
    // Generate a random border radius.
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text("Level 3"),
        routeName: 'levelFour',
      ),
      backgroundColor: backgroundColor,
      body: Padding(
          padding: EdgeInsets.all(100.0),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  animationTap();
                });
              },
              child: AnimatedContainer(
                width: _width <= 50 ? _width = 400 : _width,
                height: _height <= 50 ? _height = 400 : _height,
                decoration: BoxDecoration(
                  borderRadius: _borderRadius,
                ),
                duration: Duration(milliseconds: 0004),
                curve: Curves.easeIn,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/dash.gif",
                  scale: 2.9,
                ),
              ))),
    );
  }
}
