import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../misc/method.dart';
import '../../../providers/router/page_routes.dart';
import 'line.dart';
import 'profile_item.dart';

Container accountItems(WidgetRef ref) {
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
        const Text('Account'),
        verticalSpace(10),
        line(),
        verticalSpace(20),
        profileItem(
          'Update Profile',
          Icons.person,
          onTap: () => ref.read(routerProvider).pushNamed('update-profile'),
        ),
        verticalSpace(20),
        line(),
        verticalSpace(20),
        profileItem(
          'My Wallet',
          Icons.wallet,
          onTap: () => ref.read(routerProvider).pushNamed('wallet-page'),
        ),
      ],
    ),
  );
}
