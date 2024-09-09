import '../../../data/repositories/transaction_repositorie.dart';
import '../../transaction.dart';
import '../create_transaction/create_transactio_params.dart';
import '../create_transaction/create_transaction.dart';
import 'top_up_param.dart';
import '../usecase.dart';

import '../../result.dart';

class TopUp implements Usecase<Result<void>, TopUpParam> {
  final TransactionRepositorie _transactionRepositorie;

  TopUp({required TransactionRepositorie transactionRepositorie})
      : _transactionRepositorie = transactionRepositorie;
  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepositorie: _transactionRepositorie);

    int transactionTime = DateTime.now().millisecondsSinceEpoch;
    var createTransactionResult = await createTransaction(
      CreateTransactioParams(
        transaction: Transaction(
          id: 'flx-Topup-$transactionTime-${params.uid}',
          uid: params.uid,
          title: 'Top Up',
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
        ),
      ),
    );
    print('param ${-params.amount} $createTransactionResult');
    return switch (createTransactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(message: _) => const Result.failed('failed to top up'),
    };
  }
}
