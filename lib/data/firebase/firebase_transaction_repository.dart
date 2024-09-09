import 'firebase_user_repo_impl.dart';
import '../repositories/transaction_repositorie.dart';
import '../../domain/result.dart';
import '../../domain/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepository implements TransactionRepositorie {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepository(
      {firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;
  @override
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactionCollection =
        _firebaseFirestore.collection('transaction');
    try {
      var currentBalance =
          await FirebaseUserRepository().getUserBalance(uid: transaction.uid);

      if (currentBalance.isSuccess) {
        int previousBalance = currentBalance.resultValue!;
        if (previousBalance - transaction.total >= 0) {
          await transactionCollection
              .doc(transaction.id)
              .set(transaction.toJson());
          var result = await transactionCollection.doc(transaction.id).get();

          if (result.exists) {
            await FirebaseUserRepository().updateUserBalance(
                uid: transaction.uid,
                balance: previousBalance - transaction.total);
            return Result.success(
              Transaction.fromJson(result.data()!),
            );
          } else {
            return const Result.failed('failed to create transaction data');
          }
        } else {
          return const Result.failed('saldo tidak cukup');
        }
      } else {
        return const Result.failed('failed get user balance');
      }
    } catch (e) {
      return const Result.failed('failed create transaction');
    }
  }

  @override
  Future<Result<List<Transaction>>> getUserTransaction(
      {required String uid}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactionCollection =
        _firebaseFirestore.collection('transaction');

    try {
      var result =
          await transactionCollection.where('uid', isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map(
              (e) => Transaction.fromJson(e.data()),
            )
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('failed get user transaction');
    }
  }
}
