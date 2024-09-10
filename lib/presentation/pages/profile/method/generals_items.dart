import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../misc/method.dart';
import 'line.dart';
import 'profile_item.dart';

Container genenralItems(WidgetRef ref) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border:
          Border.all(color: Colors.blue.shade900.withOpacity(0.3), width: 2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('General'),
        verticalSpace(10),
        line(),
        verticalSpace(20),
        profileItem(
          'Notification',
          Icons.notifications,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'Language',
          Icons.language,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'Language',
          Icons.language,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'Country',
          Icons.flag,
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'Clear Cache',
          Icons.delete,
        ),
      ],
    ),
  );
}
