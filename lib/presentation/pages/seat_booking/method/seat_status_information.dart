import 'package:flutter/material.dart';

import '../../../misc/method.dart';

Widget seatStatusInformation(
        {double width = 30, double height = 30, required ThemeData theme}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        horizontalSpace(5),
        const Text(
          'Available',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        horizontalSpace(10),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        horizontalSpace(5),
        const Text(
          'Reserved',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        horizontalSpace(10),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        horizontalSpace(5),
        const Text(
          'Selected',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
