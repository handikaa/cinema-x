import '../../../data/repositories/transaction_repositorie.dart';
import 'create_transactio_params.dart';
import '../usecase.dart';

import '../../result.dart';

class CreateTransaction
    implements Usecase<Result<void>, CreateTransactioParams> {
  final TransactionRepositorie _transactionRepositorie;

  CreateTransaction({required TransactionRepositorie transactionRepositorie})
      : _transactionRepositorie = transactionRepositorie;
  @override
  Future<Result<void>> call(CreateTransactioParams params) async {
    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var result = await _transactionRepositorie.createTransaction(
      transaction: params.transaction.copyWith(
        transactionTime: transactionTime,
        id: params.transaction.id ??
            'flx-$transactionTime-${params.transaction.uid}',
      ),
    );

    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: final message) => Result.failed(message),
    };
  }
}
