import '../../domain/result.dart';
import '../../domain/transaction.dart';

abstract interface class TransactionRepositorie {
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransaction({required String uid});
}
