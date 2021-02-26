import 'package:ColorSwap/components/reusableAppBar.dart';
import 'package:ColorSwap/functional/animation_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class LevelFour extends StatefulWidget {
  @override
  _LevelFourState createState() => _LevelFourState();
}

class _LevelFourState extends State<LevelFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: Text("Level 4"),
        routeName: 'levelFive',
      ),
      backgroundColor: color,
      body: Center(
        child: AnimationPage(),
      ),
    );
  }
}
