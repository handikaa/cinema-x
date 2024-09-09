import '../../../misc/constants.dart';
import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) => Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF252836),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search Movie',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 50,
          width: 80,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: saffron),
            child: const Icon(Icons.search, color: Colors.white, size: 30),
          ),
        )
      ],
    );
