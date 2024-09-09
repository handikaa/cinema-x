import 'package:flix_id/presentation/pages/wallet_page/method/card_pattern.dart';
import 'package:flix_id/presentation/pages/wallet_page/method/membership_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'card_content.dart';

Widget walletCard(WidgetRef ref) => Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          cardPattern(),
          membershipBanner(),
          cardContent(ref),
        ],
      ),
    );
