import 'package:flutter/material.dart';

class AssetsLocation {
  static String iconPath = 'assets/icons/';
  static String imagePath = 'assets/images/';
  static ImageProvider iconLocation(String iconNammed) {
    final location = AssetImage('$iconPath$iconNammed.png');
    return location;
  }

  static ImageProvider imageLocation(String imageNammed) {
    final location = AssetImage('$imagePath$imageNammed.png');
    return location;
  }
}
