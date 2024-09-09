import 'package:flutter/material.dart';

Widget titleCinema({required String title}) => Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
