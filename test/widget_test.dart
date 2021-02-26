// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ColorSwap/screens/level_one.dart';
import 'package:ColorSwap/screens/level_three.dart';
import 'package:ColorSwap/screens/level_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Checking is appBar title rights
  testWidgets('AppBarTitle', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LevelOne()));
    expect(find.widgetWithText(AppBar, "Level 1"), findsOneWidget);
  });

  //Checking start color  and requirement text rights
  testWidgets('Center text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LevelOne()));
    expect(find.text("Hey there"), findsOneWidget);

    final background = tester.firstWidget(find.byType(Container)) as Container;
    expect(background.color, Color(0xff2196f3));
  });
  //Checking that color is change, when user tap on screen
  testWidgets('Check changing color', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LevelOne()));

    final background = tester.firstWidget(find.byType(Container)) as Container;
    expect(background.color, Color(0xff2196f3));

    await tester.tap(find.byType(Container)) as Container;

    await tester.pump();

    expect(find.byType(Container), isNot(Color(0xff2196f3)));
  });
  //Checking start text in level two
  testWidgets('Level two text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LevelTwo()));
    expect(find.text("Hi"), findsOneWidget);
  });

  //Checking background color level three is correct
  testWidgets('Backgound color level three', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LevelThree()));

    final background = tester.firstWidget(find.byType(Scaffold)) as Scaffold;
    expect(background.backgroundColor, Color(0xFFfc8d8d));
  });
}
