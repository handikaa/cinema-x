import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../misc/method.dart';
import 'line.dart';
import 'profile_item.dart';

Container moreItems(WidgetRef ref) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border:
          Border.all(color: Colors.blue.shade900.withOpacity(0.3), width: 2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('More'),
        verticalSpace(10),
        line(),
        verticalSpace(20),
        profileItem(
          'Legal and Policies',
          Icons.shield,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'Help & Feedback',
          Icons.question_mark,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'About Us',
          Icons.info,
        ),
      ],
    ),
  );
}
