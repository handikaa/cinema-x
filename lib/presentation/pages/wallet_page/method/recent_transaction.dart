import 'package:flix_id/presentation/widgets/transaction_card.dart';

import '../../../misc/method.dart';
import '../../../providers/transaction_data_provider/transactio_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Widget> recentTransaction(WidgetRef ref) => [
      const Text(
        'Recent Transactions',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      verticalSpace(24),
      ...ref.watch(transactioDataProvider).when(
            data: (transactions) {
              // transactions.isEmpty ?[]:
              final sortedTransactions = transactions.toList()
                ..sort((a, b) =>
                    -a.transactionTime!.compareTo(b.transactionTime!));
              if (sortedTransactions.isNotEmpty) {
                return sortedTransactions
                    .map((transaction) =>
                        TransactionCard(transaction: transaction))
                    .toList();
              }
              return [const Text('No transaction')];
            },
            error: (error, stackTrace) => [],
            loading: () => [const CircularProgressIndicator()],
          ),
    ];
