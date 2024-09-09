import 'package:flutter/material.dart';

Map<double, SizedBox> _vertical = {};
Map<double, SizedBox> _horizontal = {};

SizedBox verticalSpace(double height) {
  if (!_vertical.containsKey(height)) {
    _vertical[height] = SizedBox(
      height: height,
    );
  }

  return _vertical[height]!;
}

SizedBox horizontalSpace(double width) {
  if (!_horizontal.containsKey(width)) {
    _horizontal[width] = SizedBox(
      width: width,
    );
  }

  return _horizontal[width]!;
}
