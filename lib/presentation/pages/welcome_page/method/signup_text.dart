import 'package:flutter/material.dart';

Row signUpText(TextTheme textTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Or Sign up with?",
        style: textTheme.bodyMedium,
      ),
    ],
  );
}
