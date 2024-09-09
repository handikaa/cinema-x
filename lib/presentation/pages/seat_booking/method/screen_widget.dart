import 'package:flutter/material.dart';

List<Widget> screenWidget() => [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amberAccent.withOpacity(0.3),
              Colors.amberAccent.withOpacity(0.1),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        height: 70,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
        ),
        height: 5,
      ),
    ];
