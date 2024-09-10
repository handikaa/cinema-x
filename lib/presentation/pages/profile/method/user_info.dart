import 'dart:math';

import '../../../misc/assets.dart';
import '../../../misc/method.dart';
import '../../../providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref, ThemeData theme) => [
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue.shade900.withOpacity(0.3), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ref.watch(userDataProvider).valueOrNull?.photoUrl !=
                          null
                      ? NetworkImage(
                          ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                      : AssetImage(
                          photoList[Random().nextInt(photoList.length)],
                        ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ref.watch(userDataProvider).valueOrNull?.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    ref.watch(userDataProvider).valueOrNull?.email ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_square,
                size: 30,
                color: theme.colorScheme.primary,
              ),
            )
          ],
        ),
      )
    ];

List<String> photoList = [
  placeholder,
  pp1,
  pp2,
  pp3,
  pp4,
  pp5,
  pp6,
];
