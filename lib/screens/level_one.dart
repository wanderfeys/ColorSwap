import 'package:ColorSwap/components/reusableAppBar.dart';
import 'package:ColorSwap/functional/color_generation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class LevelOne extends StatefulWidget {
  @override
  _LevelOneState createState() => _LevelOneState();
}

class _LevelOneState extends State<LevelOne> with ColorGeneration {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          showLeading: true,
          appBar: AppBar(),
          title: Text("Level 1"),
          routeName: 'levelTwo',
        ),
        body: GestureDetector(
          //Returns new color for background when user is tap on screen
          onTap: () {
            setState(() {
              colorGenerate();
            });
          },
          child: Container(
            color: color, //Random color variable
            child: Center(
              child: Text(
                "Hey there",
                style: TextStyle(
                    color: textColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
