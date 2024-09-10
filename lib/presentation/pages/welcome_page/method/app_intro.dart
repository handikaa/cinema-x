import 'package:flutter/material.dart';

import '../../../misc/assets_location.dart';
import '../../../misc/method.dart';

Padding appIntro(
    {required TextStyle? titleStyle, required TextStyle? subtitleStyle}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 60),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetsLocation.imageLocation('logo'),
          width: 88,
        ),
        verticalSpace(16),
        Text('CINEMAX', style: titleStyle),
        verticalSpace(10),
        Text(
          'Enter your registered\nPhone Number to Sign Up',
          style: subtitleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
