import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ColorSwap/constants.dart';

class ColorGeneration {
  /// Returns  color that was randomly generated and check is backround color != text color for visibality
  colorGenerate() {
    if (color != textColor) {
      color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0); //Generate new color
      return color;
    } else if (color == textColor) {
      textColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
      return textColor;
    }
  }
}
