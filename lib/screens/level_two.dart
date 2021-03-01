import 'package:ColorSwap/components/reusableAppBar.dart';
import 'package:ColorSwap/constants.dart';
import 'package:ColorSwap/functional/color_generation.dart';
import 'package:flutter/material.dart';

class LevelTwo extends StatefulWidget {
  @override
  _LevelTwoState createState() => _LevelTwoState();
}

class _LevelTwoState extends State<LevelTwo> with ColorGeneration {
  List<String> textArray = [
    "Hi",
    "this",
    "is",
    "test",
    "application",
    "enjoy",
    "next",
    "level"
  ];

  var _index = 0;

  /// Returns new  item for text widget
  changeText() {
    _index++;
    if (_index >= textArray.length) {
      _index = 0;
      return _index;
    }
  }

  var backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text("Level 2"),
        routeName: 'levelThree',
      ),
      body: GestureDetector(
        //Returns a new background color and change text on screen
        onTap: () {
          setState(() {
            colorGenerate();
            changeText();
          });
        },
        child: Container(
          color: color,
          child: Center(
            child: Text(
              textArray[_index],
              style: TextStyle(
                  color: textColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
