import '../../../domain/result.dart';
import '../../../domain/transaction.dart';
import '../../../domain/usecase/get_transaction/get_transaction.dart';
import '../../../domain/usecase/get_transaction/get_transaction_params.dart';
import '../usecase/get_transaction/get_transaction_provider.dart';
import '../user_data_provider/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/user.dart';

part 'transactio_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactioData extends _$TransactioData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();
      GetTransaction getTransaction = ref.read(getTransactionProvider);

      var result = await getTransaction(GetTransactionParams(uid: user.uid));

      if (result case Success(value: final transaction)) {
        return transaction;
      }
    }
    return [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaction getTransaction = ref.read(getTransactionProvider);

      var result = await getTransaction(GetTransactionParams(uid: user.uid));

      switch (result) {
        case Success(value: final transactions):
          state = AsyncData(transactions);
        case Failed(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }

  Future<void> deleteTransactionData() async {
    // Set the state to an empty list to clear transaction data
    state = const AsyncData([]);
  }
}
