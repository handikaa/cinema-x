import 'dart:math';

import '../../../misc/assets.dart';
import '../../../misc/method.dart';
import '../../../providers/user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> userInfo(WidgetRef ref) => [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: ref.watch(userDataProvider).valueOrNull?.photoUrl != null
                ? NetworkImage(
                    ref.watch(userDataProvider).valueOrNull!.photoUrl!)
                : AssetImage(
                    photoList[Random().nextInt(photoList.length)],
                  ),
            fit: BoxFit.contain,
          ),
        ),
      ),
      verticalSpace(20),
      Text(
        ref.watch(userDataProvider).valueOrNull?.name ?? '',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        ref.watch(userDataProvider).valueOrNull?.email ?? '',
        style: const TextStyle(
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
      verticalSpace(20),
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
