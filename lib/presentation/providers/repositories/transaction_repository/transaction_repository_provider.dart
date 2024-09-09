import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/firebase/firebase_transaction_repository.dart';
import '../../../../data/repositories/transaction_repositorie.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepositorie transactionRepositorie(TransactionRepositorieRef ref) =>
    FirebaseTransactionRepository();
