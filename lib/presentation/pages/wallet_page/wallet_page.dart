import 'package:flix_id/presentation/providers/user_data_provider/user_data_provider.dart';
import 'package:intl/intl.dart';

import '../../misc/method.dart';
import '../../providers/router/page_routes.dart';
import '../../widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'method/recent_transaction.dart';
import 'method/wallet_card.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                walletCard(ref),
                verticalSpace(24),
                ...recentTransaction(ref),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
