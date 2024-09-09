import '../../../data/repositories/transaction_repositorie.dart';
import '../../transaction.dart';
import '../usecase.dart';

import '../../result.dart';
import 'get_transaction_params.dart';

class GetTransaction
    implements Usecase<Result<List<Transaction>>, GetTransactionParams> {
  final TransactionRepositorie _transactionRepositorie;

  GetTransaction({required TransactionRepositorie transactionRepositorie})
      : _transactionRepositorie = transactionRepositorie;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParams params) async {
    var transactionListResult =
        await _transactionRepositorie.getUserTransaction(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message),
    };
  }
}
