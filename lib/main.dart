import 'screens/level_three.dart';
import 'screens/level_two.dart';
import 'package:flutter/material.dart';
import 'screens/level_one.dart';
import 'screens/level_four.dart';
import 'screens/level_five.dart';

void main() {
  runApp(ColorSwap());
}

class ColorSwap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "levelOne",
      routes: {
        'levelOne': (context) => LevelOne(),
        'levelTwo': (context) => LevelTwo(),
        'levelThree': (context) => LevelThree(),
        'levelFour': (context) => LevelFour(),
        'levelFive': (context) => FiveLevel(),
      },
    );
  }
}
