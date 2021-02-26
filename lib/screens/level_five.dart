import 'dart:ui';
import 'dart:math' as math;
import 'package:ColorSwap/components/reusableAppBar.dart';
import 'package:ColorSwap/constants.dart';
import 'package:ColorSwap/functional/painter.dart';
import 'package:flutter/material.dart';

class FiveLevel extends StatefulWidget {
  @override
  _FiveLevelState createState() => _FiveLevelState();
}

class _FiveLevelState extends State<FiveLevel> {
  final _offsets = <Offset>[]; //array for screen coordinates
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text("Level 5"),
        routeName: "levelTwo",
        showButton: true,
        onPress: () {
          setState(() {
            colorPaint = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0); //change color for paint
          });
        },
        colorButton: colorPaint,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _offsets.add(details.localPosition);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _offsets.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            _offsets.add(null);
          });
        },
        child: Center(
          child: CustomPaint(
            painter: WindowPaint(
                offsets: _offsets), //widget that handles coordinates
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}
