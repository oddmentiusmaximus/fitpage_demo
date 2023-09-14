import 'package:flutter/material.dart';

class ColorParser {
  static Color getColor(String color) {
    switch (color) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
